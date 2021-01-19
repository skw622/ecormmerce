
import os
import gnupg
from pprint import pprint

from django.contrib import messages
from django.contrib.auth import authenticate, get_user_model, login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import UpdateView, ListView, DetailView, FormView
from orders.models import OrderItem, Order, User, Pay
from django.shortcuts import render, get_object_or_404, redirect

from .forms import SignUpForm, LoginForm, UserPgpChangeForm, GPGAuthForm, Changetermsform
from dark_web.mixins import RequestFormAttachMixin
from accounts.models import User as VendorUser
from accounts.models import VendorTerm, VendorFavorite
from star_ratings.models import Rating, UserRating
from main.models import Product, Message
from main.views import cryptocurrencies
from django.db.models import Q
from datetime import timedelta, datetime
from django.utils import timezone
import requests
from bitcoinrpc.authproxy import AuthServiceProxy

from .tasks import update
from django.http import HttpResponseRedirect
import random
# Create your views here.


# User ORDER details page
class UserOrderDetailView(LoginRequiredMixin, DetailView):
    template_name = 'orders/order-detail.html'
    context_object_name = "order_detail"

    def get_object(self, queryset=None):
        order_id = self.kwargs.get("order_id")
        order_item = OrderItem.objects.filter(
            order_id=order_id, author=self.request.user)

        # order = Order.objects.filter(id=order_id).first()
        # return order

        return order_item


# User ORDER(s) page
class UserOrdersListView(LoginRequiredMixin, ListView):
    template_name = 'orders/order-list.html'
    context_object_name = "orders"

    def get_queryset(self):
        Order.objects.filter(~Q())
        time_delta = timezone.now() - timedelta(hours=2)
        # return Order.objects.filter(payment_id__isnull=False , user=self.request.user)
        # aaa = Order.objects.filter(updated__range=(time_delta, timezone.now()))
        return Order.objects.filter(Q(updated_at__range=(time_delta, timezone.now()), paid=1, user=self.request.user) | Q(user=self.request.user, paid__gt=1)).select_related('payment')

# User PROFILE update page


class UserPgpUpdateView(LoginRequiredMixin, FormView):
    form_class = UserPgpChangeForm
    template_name = "profile/update-pgp.html"

    def get_context_data(self, **kwargs):
        context = super(UserPgpUpdateView, self).get_context_data(**kwargs)
        context['pgp_form'] = UserPgpChangeForm
        return context

    # def get_object(self, queryset=None):
    #     return self.request.user

    def form_valid(self, form):
        print("Valid")
        request = self.request
        user = self.request.user
        print(request.user)
        print(form.cleaned_data)
        pgp_key = form.cleaned_data.get('pgp_key')
        user.pgp_key = pgp_key
        user.save()
        print("Confirm")
        print(user.pgp_key)
        msg = "PGP Key updated successfully"
        messages.success(request, msg)
        return redirect("user_profile")

    def form_invalid(self, form):
        print("Invalid")
        request = self.request
        msg = "Form invalid"
        messages.success(request, msg)
        return redirect("user_profile")

# User PROFILE update page


class Changeterms(LoginRequiredMixin, FormView):
    form_class = Changetermsform
    template_name = "profile/changeterms.html"

    def get_context_data(self, **kwargs):
        context = super(Changeterms, self).get_context_data(**kwargs)
        context['terms_form'] = Changetermsform
        return context

    # def get_object(self, queryset=None):
    #     return self.request.user

    def form_valid(self, form):
        print("Valid")
        print("this is the form", form.cleaned_data)
        user = self.request.user
        print("this is the user", user)
        desc = form.cleaned_data.get('description')
        new_term = VendorTerm(userId=user, description=desc)
        new_term.save()
        return redirect("user_profile")

    def form_invalid(self, form):
        print("Invalid")
        request = self.request
        msg = "Form invalid"
        messages.success(request, msg)
        return redirect("user_profile")


# User PROFILE page
class UserProfileView(LoginRequiredMixin, DetailView):
    template_name = "profile/user-profile.html"
    model = User
    def get_context_data(self, **kwargs):
        context = {}
        try:
            terms = VendorTerm.objects.get(userId=self.request.user)
            print(terms)
            context['terms'] = VendorTerm.objects.get(userId=self.request.user).description
        except:
            context['terms'] = None
        return context
    #    #context = super(UserProfileView, self).get_context_data(**kwargs)
    #    message = len(Message.objects.filter(check=False))
    #    #context['pgp_form'] = UserPgpChangeForm
    #    #context['new_message'] = message
    #    context = {
    #        'user': self.request.user,
    #        'new_message': message
    #    }

    def get_object(self, queryset=None):
        return self.request.user

# User Sign-up View
def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            raw_password = form.cleaned_data.get('password1')
            user_ = form.save()
            user = authenticate(username=user_.username, password=raw_password)
            login(request, user)

            code_bip39 = user.code_bip39
            msg = "Hello " + user.username.upper() + ". Welcome to OnionShop. Code: " + code_bip39.upper()
            messages.success(request, msg)
            return redirect("product_list")
    else:
        form = SignUpForm()
    return render(request, 'registration/signup.html', {'form': form})


# GPG auth
def gpgauth(request):
    # decrypt randomstring with users
    user = User.objects.get(username = request.session['username'])
    gpg = gnupg.GPG()
    import_result = gpg.import_keys(user.pgp_key)
    pprint(import_result.results)

    encrypted_data = gpg.encrypt(request.session['orgkey'], import_result.fingerprints[0], armor=True, always_trust=True)
    encrypted_string = str(encrypted_data)
    print (request.session['orgkey'])
    print (str(encrypted_data.ok))
    print(encrypted_string)
    return render(request, "gpgauth.html", {"encmessage" : encrypted_string})


def gpgverify(request):

    error_url = '/signin/gpgauth/'
    success_url = '/'

    if request.method == 'POST':

        message = request.POST['message']

        if message != request.session['orgkey']:
            msg = "Invalid Key"
            messages.error(request, msg)
            return redirect(error_url)

        username = request.session['username']
        password = request.session['password']
        user = authenticate(request, username=username, password=password)
        login(request, user)
        msg = "Welcome back " + user.username.upper()
        messages.success(request, msg)
        return redirect(success_url)

    msg = "Error Invalid Key"
    messages.error(request, msg)
    return redirect(error_url)


# User Sign-in View
class LoginView(RequestFormAttachMixin, FormView):
    form_class = LoginForm
    success_url = '/signin/gpgauth/'
    template_name = "registration/login.html"

    def form_valid(self, form):
        request = self.request
        user = request.user
        users = User.objects.get(username = request.session['username'])
        if str(users.pgp_key) == "None":
            user = authenticate(request, username=request.session['username'], password=request.session['password'])
            login(request, user)
            msg = "Welcome back " + user.username.upper()
            messages.success(request, msg)
            self.success_url = "/"
        if not users.is_tfalogin:
            msg = "Welcome back " + user.username.upper()
            messages.success(request, msg)
            self.success_url = "/"
        return redirect(self.success_url)


# Use 2fa pgp login
def usetfalogin(request):
    user = User.objects.get(username = request.session['username'])
    user.is_tfalogin = request.POST['loginmethod']
    user.save()
    messages.success(request, "Successed")
    return redirect("user_profile")

# vendor Public Profile View
def vendorProfile(request,id=None):
    message = len(Message.objects.filter(check=False))
    if request.method == 'GET' and id is not None or id is not "":
        vendor=User.objects.values('pgp_key').filter(id=id)
    else:
        raise Exception("404")

    context={
        'user':vendor[0],
        'new_message': message
    }
    return render(request,'profile/vendor-profile.html',context)


def vendorPublicProfile(request, id = None):

    if request.method == 'POST':

        if VendorFavorite.objects.filter(Q(vendor_id=id) & Q(user=request.user)).count() == 0:
            obj = VendorFavorite()
            obj.vendor_id = id
            obj.user_id = request.user.id
            obj.save()

            vendor_user = User.objects.filter(Q(id=id))
            msg = "%s was added to my favorite" % vendor_user[0].username
            messages.success(request, msg)
        else:
            vendor_user = User.objects.filter(Q(id=id))
            msg = "%s was already added to my favorite" % vendor_user[0].username
            messages.success(request, msg)

    vendorProducts=Product.objects.filter(productOwnerID=id)
    ratingdict={}
    for vendorProduct in vendorProducts:
        ratings = Rating.objects.filter(object_id=vendorProduct.id)
        if ratings:
            ratingsObject = UserRating.objects.filter(rating=ratings[0].id).first()
            ratingdict.update([(ratingsObject,vendorProduct.name)])
        else:
            ratingsObject = None
    vendorUser=VendorUser.objects.filter(id=id)
    vendorTerm=VendorTerm.objects.filter(userId=id)
    cryptoData = cryptocurrencies()

    context={
        "vendorUser":vendorUser[0],
        "vendorTerm":vendorTerm[0].description,
        "ratingsDict":ratingdict,
        "cryptoData":cryptoData
    }
    return render(request, 'profile/vendor-public-profile.html', context)

def complete_order(request, order_id):
    order = Order.objects.filter(id=order_id)
    order.update(paid=8)
    pay = Pay.objects.filter(id=order.first().payment_id)
    pay.update(status=8)
    order_item = OrderItem.objects.filter(order_id=order_id)
    product_id = order_item.first().product_id
    product = Product.objects.filter(id=product_id)
    vendor_id = product.first().productOwnerID_id
    message_content = "Order are completed by customer."
    new_message = Message.objects.create(content=message_content, receiver=User.objects.get(id=vendor_id),
                                         sender=User.objects.get(username='admin'))
    new_message.save()
    msg = "Order are completed."
    # messages.add_message(request, 5, messages.SUCCESS, msg)
    messages.success(request, msg)
    return redirect('user_order_list')

def dispute_order(request, order_id):
    order = Order.objects.filter(id=order_id)
    order.update(paid=5)
    pay = Pay.objects.filter(id=order.first().payment_id)
    pay.update(status=5)
    order_item = OrderItem.objects.filter(order_id=order_id)
    product_id = order_item.first().product_id
    product = Product.objects.filter(id=product_id)
    vendor_id = product.first().productOwnerID_id
    message_content = "Customer require order to dispute. To dispute order can be approved by the staff. Please contact with staff."
    new_message = Message.objects.create(content=message_content, receiver=User.objects.get(id=vendor_id),
                                         sender=User.objects.get(username='admin'))
    new_message.save()
    msg = "Your dispute requirement have been sent to staff. To dispute order can be approved by the staff."
    # messages.add_message(request, 5, messages.SUCCESS, msg)
    messages.success(request, msg)
    return redirect('user_order_list')


def favorite_detail(request):

    favorites = VendorFavorite.objects.filter(Q(user=request.user))
    context_object = {'favorites': favorites}

    return render(request, 'profile/favorite_list.html', context_object)

def user_ratings(request):

    favorites = VendorFavorite.objects.filter(Q(user=request.user))
    context_object = {'favorites': favorites}
    return render(request, 'profile/ratings.html', context_object)
def get_vendor_stats(request):

    if request.method == 'POST':

        btc_course = (requests.get("https://api.coindesk.com/v1/bpi/currentprice/USD.json").json())["bpi"]['USD']["rate_float"]
        usd_price = 1
        btc_price = round((float(usd_price) / float(btc_course)), 8)
        rpc_user = "NSA12012"
        rpc_password = "ZIwnhqsa"
        rpc_connection = AuthServiceProxy("http://%s:%s@213.227.140.1:8332" % (rpc_user, rpc_password))
        address = rpc_connection.getnewaddress()

        pay = Pay.objects.create(timestamp=timezone.now(), btc_course=btc_course, amount_expected=btc_price,
                                 amount_received=0, author=request.user.username, status=0, address=address)
        pay.save()

        order = Order.objects.create(address="upgrade_vendor__", user=request.user, payment=pay, paid="1")
        order.save()

        # content = "Will send you message after confirm your transaction. Please wait some times during confirm your transaction."
        # return render(request, "orders/order/waiting.html", {'content': content})
        return render(request, 'orders/order/pay.html',
                    {'order_id': order.id, 'addres': address, 'btc_course': btc_course, "total_price": usd_price,
                    "btc_price": btc_price})

    elif request.method == 'GET':
        return render(request, 'profile/get-vendor-stats.html')


# this function to update terms and conditions of the User
def changeterms(request):
    pass
