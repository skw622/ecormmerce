from django.contrib import admin
from .models import Category, Product, Message


class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug']
    prepopulated_fields = {'slug': ('name',)}


admin.site.register(Category, CategoryAdmin)


class ProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug', 'price', 'stock', 'available', 'updated_at','productOwnerID','country']
    list_filter = ['category','available', 'created_at', 'updated_at']
    search_fields=('country',)
    list_editable = ['price', 'stock', 'available']
    prepopulated_fields = {'slug': ('name',)}


class MessageAdmin(admin.ModelAdmin):
    list_display = ['sender', 'receiver', 'content']

admin.site.register(Product, ProductAdmin)
admin.site.register(Message, MessageAdmin)
