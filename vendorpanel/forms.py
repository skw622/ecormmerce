from django import forms
from main.models import Product
from vendorpanel.models import ShippingOption

class ProductForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(ProductForm, self).__init__(*args, **kwargs)
        self.fields['category'].widget.attrs['class'] = 'new-form-control'
        self.fields['name'].widget.attrs['class'] = 'new-form-control'
        self.fields['slug'].widget.attrs['class'] = 'new-form-control'
        self.fields['description'].widget.attrs['class'] = 'new-form-control'
        self.fields['price'].widget.attrs['class'] = 'new-form-control'
        self.fields['price'].widget.attrs['min'] = '1.0'
        self.fields['available'].widget.attrs['class'] = 'new-form-control'
        self.fields['stock'].widget.attrs['class'] = 'new-form-control'
        self.fields['image'].widget.attrs['class'] = 'new-form-control'
        self.fields['country'].widget.attrs['class'] = 'new-form-control'

    class Meta:
        model = Product
        fields = ['category', 'name', 'slug', 'description', 'price', 'available', 'stock', 'image', 'country']


class ShippingOptionForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(ShippingOptionForm, self).__init__(*args, **kwargs)
        self.fields['shipping_type'].widget.attrs['class'] = 'new-form-control'
        self.fields['shipping_area'].widget.attrs['class'] = 'new-form-control'
        self.fields['price'].widget.attrs['class'] = 'new-form-control'
        self.fields['description'].widget.attrs['class'] = 'new-form-control'

    class Meta:
        model = ShippingOption
        fields = ['shipping_type', 'shipping_area', 'price', 'description']
