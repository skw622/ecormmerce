from django.contrib import admin
from .models import Order, OrderItem, Pay


class OrderItemInline(admin.TabularInline):
    model = OrderItem
    raw_id_fields = ['order', 'product']


class OrderAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'paid', 'created_at', 'updated_at']
    list_filter = ['paid', 'created_at', 'updated_at']
    inlines = [OrderItemInline]


admin.site.register(Order, OrderAdmin)
admin.site.register(Pay)
