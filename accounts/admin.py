from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from accounts.models import VendorTerm
from .forms import UserAdminCreationForm, UserAdminChangeForm


User = get_user_model()

# Remove Group Model from admin. We're not using it.
admin.site.unregister(Group)


class UserAdmin(BaseUserAdmin):
    # The forms to ADD and CHANGE user instances
    form = UserAdminChangeForm
    add_form = UserAdminCreationForm

    # The fields to be used in displaying the User model.
    list_display = ('username', 'is_admin', 'is_staff', 'is_vendor', 'is_active', 'created_at', 'updated_at')
    list_filter = ('is_admin', 'is_staff', 'is_vendor', 'is_active')
    list_editable = ('is_active', 'is_vendor')
    fieldsets = (
        ('Standard info', {'fields': ('username', 'password')}),
        ('Code Confirm Account', {'fields': ('code_bip39', )}),
        ('Other info', {'fields': ('pgp_key', 'level', )}),
        ('Location info', {'fields': ('country',)}),
        ('Permissions', {'fields': ('is_admin', 'is_staff', 'is_active', 'is_vendor')}),
    )
    # add_fieldsets is not a standard ModelAdmin attribute. UserAdmin
    # overrides get_fieldsets to use this attribute when creating a user.
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('user', 'password1', 'password2')}
         ),
    )
    search_fields = ('username',)
    ordering = ('pk',)
    filter_horizontal = ()


admin.site.register(User, UserAdmin)
admin.site.register(VendorTerm)
