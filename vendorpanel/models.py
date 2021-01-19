from django.contrib.auth import get_user_model
from django.db import models

User = get_user_model()


class ShippingType(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name


class ShippingOption(models.Model):
    SHIPPING_AREA_CHOICES = [
        ('domestic', 'Domestic'),
        ('international', 'International')
    ]
    vendor = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="Vendor ID",
                               related_name='shipping_option', null=False)
    shipping_type = models.ForeignKey(ShippingType, on_delete=models.CASCADE, null=True)
    shipping_area = models.CharField(max_length=20, choices=SHIPPING_AREA_CHOICES, null=True)
    price = models.FloatField()
    description = models.TextField()
