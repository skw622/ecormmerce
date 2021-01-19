from cart.forms import CartAddProductForm
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
# from django.core.urlresolvers import reverse
from django.views.generic import UpdateView, ListView
from orders.models import OrderItem, Order
from django.shortcuts import render, get_object_or_404, redirect
from cryptowatch_client import Client

from .models import Category, Product, Message, BTCPrice
from django_countries import countries
from accounts.models import User, VendorTerm
from django.db.models import Q
from star_ratings.models import Rating, UserRating
from accounts.forms import LoginForm
from django.db.models import Q
from vendorpanel.models import ShippingOption

# def signup(request):
#     if request.method == 'POST':
#         form = SignUpForm(request.POST)
#         if form.is_valid():
#             user = form.save()
#             msg = "Hello " + user.username + ". Welcome to OnionShop."
#             messages.success(request, msg)
#             return redirect("product_list")
#     else:
#         form = SignUpForm()
#     return render(request, 'registration/signup.html', {'form': form})
#
#
# def signin(request):
#     if request.method == 'POST':
#         form = LoginForm(request.POST)
#         if form.is_valid():
#             user = form.save()
#             msg = "Welcome back" + user.username
#             messages.success(request, msg)
#             return redirect("product_list")
#     else:
#         form = LoginForm(request)
#     return render(request, 'registration/login.html', {'form': form})
def cryptocurrencies():
    btcPrice = BTCPrice.objects.all().order_by('-id').first()
    if btcPrice == None:
        cryptoPrice={"btcusd":"",'btcgbp':"",'btceur':""}
    else:
        cryptoPrice={"btcusd":btcPrice.btcusd,'btcgbp':btcPrice.btcgbp,'btceur':btcPrice.btceur}
    return cryptoPrice

def product_list(request, category_slug=None):
    category = None
    categories = Category.objects.all()
    products = Product.objects.filter(available=True)
    message = len(Message.objects.filter(check=False))
    #message = len(Message.objects.all())
    form = LoginForm
    if category_slug:
        print(category_slug)
        category = get_object_or_404(Category, slug=category_slug)
        products = Product.objects.filter(category=category)

    #cryptocurrenies Data
    cryptoData=cryptocurrencies()

    context = {
        'category': category,
        'categories': categories,
        'products': products,
        'cryptoData': cryptoData,
        'countries': countries,
        'form': form,
        'new_message': message,
    }
    return render(request, 'main/product/list.html', context)


def product_detail(request, id, slug):
    product = get_object_or_404(Product, id=id, slug=slug, available=True)
    cart_product_form = CartAddProductForm()
    product_stock = cart_product_form.get_product_stock(id)
    categories = Category.objects.all()
    cryptoData = cryptocurrencies()
    message = len(Message.objects.filter(check=False))

    productVendor = Product.objects.values('productOwnerID', 'country').get(id=id)
    country = countries.name(productVendor.get('country'))
    productVendor = productVendor.get('productOwnerID')

    vendor = User.objects.values('id', 'username').filter(id=productVendor, is_vendor=True)
    ratings = Rating.objects.filter(object_id=id)
    term_conditions = VendorTerm.objects.filter(userId=productVendor)
    if ratings:
        ratingsObject = UserRating.objects.filter(rating=ratings.first().id).first()
    else:
        ratingsObject = None
    if request.user.is_authenticated and product.country==request.user.country:
        shipping_options = ShippingOption.objects.filter(
                           shipping_area='domestic',
                           vendor=product.productOwnerID)
    else:
        shipping_options = ShippingOption.objects.filter(
                           shipping_area='international',
                           vendor=product.productOwnerID)

    context = {
        'product': product,
        'categories': categories,
        'cart_product_form': cart_product_form,
        'product_stock': product_stock,
        'vendor': vendor[0],
        'country': country,
        'ratingsObject': ratingsObject,
        'cryptoData': cryptoData,
        'new_message': message,
        'term_conditions': term_conditions[0],
        'shipping_options': shipping_options
    }
    return render(request, 'main/product/detail.html', context)


def search(request):
    if request.method == 'GET':
        message = len(Message.objects.filter(check=False))
        price = 0
        if request.GET.get('price'):
            price = int(request.GET.get('price'))

        country = request.GET.get('country', None)
        category = request.GET.get('category', None)
        categoryID = Category.objects.filter(name=category)
        products = {}

        if price > 0 and category is '' and country is '':
            products = Product.objects.filter(Q(price__gte=price))
        elif category and price is 0 and country is '':
            print("===================================")
            products = Product.objects.filter(category__in=categoryID)
        elif country and price is 0 and category is '':
            products = Product.objects.filter(country=country)
        elif price > 0 and category and country is '':
            products = Product.objects.filter(Q(price__gte=price), category__in=categoryID)
        elif country and price > 0 and category is '':
            products = Product.objects.filter(Q(price__gte=price), country=country)
        elif country and category and price is 0:
            products = Product.objects.filter(country=country, category__in=categoryID)
        elif price > 0 and category and country:
            products = Product.objects.filter(Q(price__gte=price), category__in=categoryID, country=country)
        elif price is 0 and category is '' and country is '':
            products = Product.objects.all

        categories = Category.objects.all()
        # cryptocurrenies Data
        cryptoData = cryptocurrencies()

        context = {
            'category': category,
            'categories': categories,
            'products': products,
            'cryptoData': cryptoData,
            'countries': countries,
            'new_message': message

        }
    else:
        raise  Exception("405")
    return render(request, 'main/product/list.html', context)


# User Notification page
class UserMessageListView(LoginRequiredMixin, ListView):
    template_name = 'message/message_list.html'
    context_object_name = "messages"

    def get_queryset(self):
        admin_ids = User.objects.filter(id=True)
        return Message.objects.filter(Q(sender__in=admin_ids) & Q(receiver=self.request.user)).order_by('-created_at')
               #| Message.objects.filter(sender=self.request.user)


# User Inbox page
class UserInboxListView(LoginRequiredMixin, ListView):
    template_name = 'inbox/inbox_list.html'
    context_object_name = "messages"

    def get_queryset(self):
        return Message.objects.filter((Q(sender=self.request.user) & Q(sender_removed=False)) |
                                      (Q(receiver=self.request.user) & Q(receiver_removed=False))).order_by('-created_at')
               #| Message.objects.filter(sender=self.request.user)


# User Inbox Send page
def inbox_send(request, receiver_id = '0'):
    if request.method == 'POST':
        obj = Message()
        obj.sender_id = request.user.id
        obj.receiver_id = request.POST.get('receiver_id')
        obj.content = request.POST.get('content')
        obj.save()

        msg = "Message sent successfully"
        messages.success(request, msg)
        return redirect("inbox_send")
    else:
        users = User.objects.all
        context_object = {'users': users, 'receiver_id': int(receiver_id)}
    return render(request, 'inbox/inbox_send.html', context_object)


# User Inbox Delete Message
def deleteMessage(request, message_id=''):
    message = Message.objects.get(pk=message_id)
    message_object = Message.objects.filter(id=message_id)

    if message.sender_id == request.user.id:
        message_object.update(sender_removed=True)
    elif message.receiver_id == request.user.id:
        message_object.update(receiver_removed=True)

    msg = "Message is deleted"
    messages.success(request, msg)
    return redirect("inbox_list")

# def user_profile(request):
#     if request.user.is_authenticated:
#         context = {
#             'object': request.user,
#         }
#         return render(request, 'main/profile/user-profile.html', context)
#     else:
#         return render(request, 'main/nlogin.html')
#
#
# class UserProfileUpdateView(LoginRequiredMixin, UpdateView):
#     form_class = UserProfileChangeForm
#
#     def get_object(self, queryset=None):
#         return self.request.user
#
#     def get_success_url(self):
#         return redirect("user_profile")
#
#
# def profile_orders(request):
#     if request.user.is_authenticated is True:
#         orders = Order.objects.filter(user=request.user)
#         context = {
#             'orders': orders,
#         }
#         return render(request, 'main/profile/order-list.html', context)
#     else:
#         return render(request, 'main/nlogin.html')
#
#
# def profile_order(request, order_id):
#     if request.user.is_authenticated is True:
#         orders = OrderItem.objects.filter(order_id=order_id, author=request.user)
#
#         context = {
#             'orders': orders,
#         }
#         return render(request, 'main/profile/order-detail.html', context)
#     else:
#         return render(request, 'main/nlogin.html')
#
