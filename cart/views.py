from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_POST
from main.models import Product
from .cart import Cart
from .forms import CartAddProductForm
from main.models import Category
from cryptowatch_client import Client
from main.models import Message
from vendorpanel.models import ShippingOption

def cryptocurrencies():
    client = Client(timeout=30)
    btcgbp = client.get_markets_price(exchange='gdax', pair='btcgbp')
    btcusd = client.get_markets_price(exchange='gdax', pair='btcusd')
    btceur = client.get_markets_price(exchange='gdax', pair='btceur')
    btcgbp_response = btcgbp.json()
    btcusd_response = btcusd.json()
    btceur_response = btceur.json()
    btcgbpPrice=btcgbp_response.get('result').get('price')
    btcusdPrice=btcusd_response.get('result').get('price')
    btceurPrice=btceur_response.get('result').get('price')
    cryptoPrice={"btcusd":btcusdPrice,'btcgbp':btcgbpPrice,'btceur':btceurPrice}
    return cryptoPrice

@require_POST
def cart_add(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    form = CartAddProductForm(request.POST)
    print(request.POST)
    if form.is_valid():
        cd = form.cleaned_data
        shipping_option = get_object_or_404(ShippingOption, id=request.POST['shippingOptionId'])
        cart.add(product=product, shipping_option=shipping_option, quantity=cd['quantity'], update_quantity=cd['update'])
    # return redirect('cart:cart_detail')
    return redirect('orders:order_create', product_id=product_id)


def cart_remove(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    cart.remove(product)
    return redirect('cart:cart_detail')


def cart_detail(request):
    cart = Cart(request)
    categories = Category.objects.all()
    cryptoData = cryptocurrencies()
    message = len(Message.objects.filter(check=False))
    for item in cart:
        item['update_quantity_form'] = CartAddProductForm(initial={'quantity': item['quantity'], 'update': True})
    context = {
        'cart': cart,
        'categories': categories,
        'cryptoData': cryptoData,
        'new_message': message
    }
    return render(request, 'cart/detail.html', context)
