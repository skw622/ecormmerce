from django.shortcuts import render, get_object_or_404
from vendorpanel.forms import ProductForm, ShippingOptionForm
from main.models import Product, Message
from orders.models import Order, OrderItem, Pay
from accounts.models import User
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import DetailView, ListView
from django.db.models import Q
from django.urls import reverse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.shortcuts import redirect

from .models import ShippingOption

# Create your views here.
#get current user
def getUserID(request):
    current_user = request.user
    return current_user.id


#add product
def addProduct(request):

    form = ProductForm()
    ownerID = getUserID(request)

    if request.user.is_vendor:
        return render(request, 'myproducts.html', {'form': form, 'ownerID': ownerID})
    else:
        return HttpResponseRedirect('/')


def addShippingOption(request):

    form = ShippingOptionForm()
    # ownerID = getUserID(request)

    if request.user.is_vendor:
        return render(request, 'newShippingOption.html', {'form': form})
    else:
        return HttpResponseRedirect('/')


# delete poduct
def deleteProduct(request, product_id):
    product_delete = Product.objects.filter(id=product_id)
    product_delete.update(available=False)

    order_list = OrderItem.objects.filter(product_id=product_id).select_related('order')
    for order_item in order_list:
        if order_item.order.paid == "2":
            Order.objects.filter(id=order_item.order.id).update(paid=3)
            Pay.objects.filter(id=order_item.order.payment_id).update(status=3)

            user_id = order_item.order.user_id
            message_content = "Your shipping product are deleted by vendor so your shipping are cancelled. Please contact staff for refunding your payment."
            Message.objects.create(content=message_content, receiver=User.objects.get(id=user_id), sender=User.objects.get(username='admin'))

    msg = "Product are deleted. Shipping of deleted product are cancelled."
    messages.warning(request, msg)
    return listProducts(request)


# delete shipping option
def deleteShippingOption(request, shipping_option_id):
    shipping_option_delete = ShippingOption.objects.filter(id=shipping_option_id)
    shipping_option_delete.delete()
    msg = "Shipping option is deleted."
    messages.warning(request, msg)
    return listShippingOptions(request)


def updateProduct(request):
    if request.method == 'POST':
        #product = get_object_or_404(Product, id=product_id)
        #form = ProductForm(request.POST, instance=product)
        form = ProductForm(request.POST)
        if form.is_valid():
            product_id = request.POST['productID']
            data = request.POST.copy()
            product_id = data.get('productID')
            name = data.get('name')
            slug = data.get('slug')
            desription = data.get('description')
            price= data.get('price')
            available = data.get('available')
            if available == 'on':
                available = 1
            else:
                available = 0
            stock = data.get('stock')
            catetory = data.get('category')
            country = data.get('country')
            ownerID = data.get('productOwnerID')
            Product.objects.filter(id=product_id).update(name=name, slug=slug, description=desription, price=price, available=available, stock=stock, category=catetory, country=country, productOwnerID=ownerID)
            #obj = form.save(commit=False)
            #obj.save()
            msg = "Product are updated."
            messages.warning(request, msg)
            return listProducts(request)


def updateShippingOption(request):
    if request.method == 'POST':
        form = ShippingOptionForm(request.POST)
        if form.is_valid():
            shipping_option_id = request.POST['shippingOptionID']
            data = request.POST.copy()
            shipping_option_id = data.get('shippingOptionID')
            shipping_type = data.get('shipping_type')
            shipping_area = data.get('shipping_area')
            desription = data.get('description')
            price= data.get('price')
            vendor = data.get('vendorID')
            check_shipping_option = ShippingOption.objects.filter(
                                    shipping_area=shipping_area,
                                    shipping_type=shipping_type,
                                    vendor=request.user).exclude(id=shipping_option_id)
            if check_shipping_option:
                msg = "You have already Shipping option created."
                messages.warning(request, msg)
                return listShippingOptions(request)
            ShippingOption.objects.filter(id=shipping_option_id).update(
            shipping_type=shipping_type, shipping_area=shipping_area, description=desription, price=price, vendor=vendor)
            msg = "Shipping Option are updated."
            messages.warning(request, msg)
            return listShippingOptions(request)


def editProduct(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    form = ProductForm(request.POST or None, instance=product)
    ownerID = getUserID(request)
    return render(request, 'updateProduct.html', {'form': form, 'ownerID': ownerID, 'product_id': product_id})


def editShippingOption(request, shipping_option_id):
    shipping_option = get_object_or_404(ShippingOption, id=shipping_option_id)
    form = ShippingOptionForm(request.POST or None, instance=shipping_option)
    ownerID = getUserID(request)
    return render(request, 'updateShippingOption.html', {'form': form, 'ownerID': ownerID, 'shipping_option_id': shipping_option_id})


#save product
def saveProduct(request):
    if request.method == 'POST':
        form = ProductForm(request.POST)

        if form.is_valid():
            print("Hello")
            product = form.save(commit=False)
            product.productOwnerID = request.user
            product.save()  # Now you can send it to DB
            return listProducts(request)
        else:
            print(form.errors)
            raise Exception("405")
    else:
        raise Exception("405")

#save new shipping option
def saveNewShippingOption(request):
    if request.method == 'POST':
        form = ShippingOptionForm(request.POST)

        if form.is_valid():
            shipping_option = form.save(commit=False)
            shipping_option.vendor = request.user

            check_shipping_option = ShippingOption.objects.filter(
                                    shipping_area=shipping_option.shipping_area,
                                    shipping_type=shipping_option.shipping_type,
                                    vendor=request.user)
            if check_shipping_option:
                msg = "You have already Shipping option created for " + shipping_option.shipping_area + ' ' +  shipping_option.shipping_type.name + "."
                messages.warning(request, msg)
                return listShippingOptions(request)
            else:
                shipping_option.save()  # Now you can send it to DB
                return listShippingOptions(request)
        else:
            print(form.errors)
            raise Exception("405")
    else:
        raise Exception("405")

#get list of shipping options
def listShippingOptions(request):
    ownerID = getUserID(request)
    shipping_options=ShippingOption.objects.filter(vendor=ownerID)
    if request.user.is_vendor:
        return render(request, 'listShippingOptions.html', {'shipping_options': shipping_options})
    else:
        return HttpResponseRedirect('/')


#get list of products
def listProducts(request):
    ownerID = getUserID(request)
    products=Product.objects.filter(productOwnerID=ownerID, available=True)

    if request.user.is_vendor:
        return render(request, 'listProducts.html', {'products': products})
    else:
        return HttpResponseRedirect('/')

def accept_order(request, order_id):
    order = Order.objects.filter(id=order_id)
    order.update(paid=7)
    pay = Pay.objects.filter(id=order.first().payment_id)
    pay.update(status=7)
    msg = "Order are accepted."
    messages.success(request, msg)
    return HttpResponseRedirect(reverse('vendor_list_new_order'))


def reject_order(request, order_id):
    order = Order.objects.filter(id=order_id)
    user_id = order.first().user_id
    order.update(paid=3)
    pay = Pay.objects.filter(id=order.first().payment_id)
    pay.update(status=3)

    message_content = "Sorry but your shopping cart are canceled by vendor. Please send BTC address to Site manager for refunding."
    new_message = Message.objects.create(content=message_content, receiver=User.objects.get(id=user_id), sender=User.objects.get(username='admin'))
    new_message.save()
    msg = "Order are cancelled."
    #messages.add_message(request, 5, messages.SUCCESS, msg)
    messages.warning(request, msg)

    #return HttpResponseRedirect(reverse('vendor_list_new_order'))
    return redirect('vendor_list_new_order')


class VendorNewOrderListView(LoginRequiredMixin, ListView):
    template_name = 'orders/order/new_order_list.html'
    context_object_name = "orders"

    def get(self, request, *args, **kwargs):
        if not self.request.user.is_vendor:
            return HttpResponseRedirect('/')

    def get_queryset(self):
        return Order.objects.filter(paid=2, user=self.request.user).select_related('payment')


class VendorNewOrderDetailView(LoginRequiredMixin, DetailView):
    template_name = 'orders/order/new_order_detail.html'
    context_object_name = "order_detail"

    def get(self, request, *args, **kwargs):
        if not self.request.user.is_vendor:
            return HttpResponseRedirect('/')

    def get_object(self, queryset=None):
        order_id = self.kwargs.get("order_id")
        orders = OrderItem.objects.filter(order_id=order_id, author=self.request.user)
        #return orders.first()
        return orders


class VendorShippedOrderListView(LoginRequiredMixin, ListView):
    template_name = 'orders/order/ship_order_list.html'
    context_object_name = "orders"

    def get(self, request, *args, **kwargs):
        if not self.request.user.is_vendor:
            return HttpResponseRedirect('/')

    def get_queryset(self):
        return Order.objects.filter(paid=7).select_related('payment')


class VendorShippedOrderDetailView(LoginRequiredMixin, DetailView):
    template_name = 'orders/order/ship_order_detail.html'
    context_object_name = "order_detail"

    def get(self, request, *args, **kwargs):
        if not self.request.user.is_vendor:
            return HttpResponseRedirect('/')

    def get_object(self, queryset=None):
        order_id = self.kwargs.get("order_id")
        orders = OrderItem.objects.filter(order_id=order_id, author=self.request.user)
        #return orders.first()
        return orders


class VendorCompleteOrderListView(LoginRequiredMixin, ListView):
    template_name = 'orders/order/complete_order_list.html'
    context_object_name = "orders"

    def get(self, request, *args, **kwargs):
        if not self.request.user.is_vendor:
            return HttpResponseRedirect('/')

    def get_queryset(self):
        return Order.objects.filter(paid=8).select_related('payment')


class VendorCompleteOrderDetailView(LoginRequiredMixin, DetailView):
    template_name = 'orders/order/complete_order_detail.html'
    context_object_name = "order_detail"

    def get(self, request, *args, **kwargs):
        if not self.request.user.is_vendor:
            return HttpResponseRedirect('/')

    def get_object(self, queryset=None):
        order_id = self.kwargs.get("order_id")
        orders = OrderItem.objects.filter(order_id=order_id, author=self.request.user)
        #return orders.first()
        return orders


class VendorCancelOrderListView(LoginRequiredMixin, ListView):
    template_name = 'orders/order/cancel_order_list.html'
    context_object_name = "orders"

    def get(self, request, *args, **kwargs):
        if not self.request.user.is_vendor:
            return HttpResponseRedirect('/')

    def get_queryset(self):
        return Order.objects.filter(Q(paid=3) | Q(paid=4)).select_related('payment')


class VendorCancelOrderDetailView(LoginRequiredMixin, DetailView):
    template_name = 'orders/order/cancel_order_detail.html'
    context_object_name = "order_detail"

    def get(self, request, *args, **kwargs):
        if not self.request.user.is_vendor:
            return HttpResponseRedirect('/')

    def get_object(self, queryset=None):
        order_id = self.kwargs.get("order_id")
        orders = OrderItem.objects.filter(order_id=order_id, author=self.request.user)
        #return orders.first()
        return orders


class VendorDisputeOrderListView(LoginRequiredMixin, ListView):
    template_name = 'orders/order/dispute_order_list.html'
    context_object_name = "orders"

    def get(self, request, *args, **kwargs):
        if not self.request.user.is_vendor:
            return HttpResponseRedirect('/')

    def get_queryset(self):
        return Order.objects.filter(Q(paid=5) | Q(paid=6)).select_related('payment')


class VendorDisputeOrderDetailView(LoginRequiredMixin, DetailView):
    template_name = 'orders/order/new_order_detail.html'
    context_object_name = "order_detail"

    def get(self, request, *args, **kwargs):
        if not self.request.user.is_vendor:
            return HttpResponseRedirect('/')

    def get_object(self, queryset=None):
        order_id = self.kwargs.get("order_id")
        orders = OrderItem.objects.filter(order_id=order_id, author=self.request.user)
        return orders.first()
