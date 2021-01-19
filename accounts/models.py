from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django_countries.fields import CountryField


class UserManager(BaseUserManager):
    def create_user(self, username, password=None, level='Member', is_staff=False, is_admin=False):
        user = self.model(username=username, level=level, is_staff=is_staff, is_admin=is_admin, is_active=True)
        user.set_password(password)
        user.save()
        return user

    def create_staffuser(self, username, password=None):
        user = self.create_user(username, password, level='Staff', is_staff=True)
        return user

    def create_superuser(self, username, password=None):
        user = self.create_user(username, password, level='Admin', is_staff=True, is_admin=True)
        return user


USER_LEVEL = (
    ('Administrator', 'Admin'),
    ('Staff', 'Staff'),
    ('Vendor', 'Vendor'),
    ('Member', 'Member'),
)


class User(AbstractBaseUser):
    username = models.CharField(max_length=120, unique=True)
    code_bip39 = models.TextField(null=True, blank=True)
    pgp_key = models.TextField(null=True, blank=True)
    image = models.ImageField(upload_to='accounts/%Y/%m/%d', blank=True)
    level = models.CharField(max_length=120, choices=USER_LEVEL, default='Member')
    is_admin = models.BooleanField(default=False)    # superuser
    is_staff = models.BooleanField(default=False)    # staff but not superuser
    is_vendor = models.BooleanField(default=False)    # user is a seller
    is_active = models.BooleanField(default=True)     # user can login
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_tfalogin = models.BooleanField(default=False)    # 2fa pgp login enabled?
    country = CountryField(null=True)

    USERNAME_FIELD = 'username'

    objects = UserManager()

    def __str__(self):
        return self.username

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    def get_code_bip39(self):
        return self.code_bip39

    def get_pgp_key(self):
        return self.pgp_key


class VendorTerm(models.Model):
    userId = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="Vendor ID", related_name='+', null=False)
    description = models.TextField(null=True, blank=True, max_length=2000)


class VendorFavorite(models.Model):
    user = models.ForeignKey(User, related_name='favorite_user', on_delete=models.CASCADE)
    vendor = models.ForeignKey(User, related_name='favorite_vendor', on_delete=models.CASCADE)
