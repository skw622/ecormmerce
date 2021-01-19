from django.contrib import admin

from .models import ShippingType, ShippingOption

# Register your models here.

admin.site.register(ShippingType)
admin.site.register(ShippingOption)
