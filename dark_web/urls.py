from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.contrib.auth.views import LogoutView
from django.conf.urls.static import static
from django.conf.urls import url
from django.views.generic import RedirectView
from accounts import views as account_views
from main import views as main_views
from vendorpanel import views as vendor_views
from main import views as product_views

urlpatterns = [
    path('alibaba/', admin.site.urls),
    path('support/', include('support.urls')),
    # path('vendor/', include('vendor.urls')),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^signup/$', account_views.signup, name='signup'),
    url(r'^signin/$', account_views.LoginView.as_view(), name='signin'),
    url(r'^signin/gpgauth/$', account_views.gpgauth, name='gpgauth'),
    url(r'^signin/gpgverify/$', account_views.gpgverify, name='gpgverify'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    url(r'^accounts/login/$', RedirectView.as_view(url='/signin')),
    url(r'^profile/usetfalogin', account_views.usetfalogin, name='usetfalogin'),
    #vendor Urls
    url(r'^vendor/addproduct', vendor_views.addProduct, name='user_vendor_addproduct'),
    url(r'^vendor/saveProduct', vendor_views.saveProduct, name='user_vendor_saveProduct'),
    url(r'^vendor/deleteProduct/(?P<product_id>\d+)/$', vendor_views.deleteProduct, name='user_vendor_deleteProduct'),
    url(r'^vendor/editProduct/(?P<product_id>\d+)/$', vendor_views.editProduct, name='user_vendor_editProduct'),
    url(r'^vendor/updateProduct/$', vendor_views.updateProduct, name='user_vendor_updateProduct'),
    url(r'^vendor/listProducts', vendor_views.listProducts, name='user_vendor_listProducts'),
    url(r'^vendorProfile/(?P<id>\d+)/', account_views.vendorProfile, name='vendorProfile'),
    url(r'^vendorPublicProfile/(?P<id>\d+)/', account_views.vendorPublicProfile, name='vendorPublicProfile'),
    url(r'^vendor/newOrders/$', vendor_views.VendorNewOrderListView.as_view(), name='vendor_list_new_order'),
    url(r'^vendor/newOrders/(?P<order_id>\d+)/$', vendor_views.VendorNewOrderDetailView.as_view(), name='vendor_detail_new_order'),
    url(r'^vendor/shipOrders/$', vendor_views.VendorShippedOrderListView.as_view(), name='vendor_list_ship_order'),
    url(r'^vendor/shipOrders/(?P<order_id>\d+)/$', vendor_views.VendorShippedOrderDetailView.as_view(), name='vendor_detail_ship_order'),
    url(r'^vendor/completeOrders/$', vendor_views.VendorCompleteOrderListView.as_view(), name='vendor_list_complete_order'),
    url(r'^vendor/completeOrders/(?P<order_id>\d+)/$', vendor_views.VendorCompleteOrderDetailView.as_view(), name='vendor_detail_complete_order'),
    url(r'^vendor/cancelOrders/$', vendor_views.VendorCancelOrderListView.as_view(), name='vendor_list_cancel_order'),
    url(r'^vendor/cancelOrders/(?P<order_id>\d+)/$', vendor_views.VendorCancelOrderDetailView.as_view(), name='vendor_detail_cancel_order'),
    url(r'^vendor/disputeOrders/$', vendor_views.VendorDisputeOrderListView.as_view(), name='vendor_list_dispute_order'),
    url(r'^vendor/disputeOrders/(?P<order_id>\d+)/$', vendor_views.VendorDisputeOrderDetailView.as_view(), name='vendor_detail_dispute_order'),
    #url(r'^vendor/acceptOrder/(?P<order_id>\d+)/$', vendor_views.VendorAcceptOrderView.as_view(), name='vendor_accept_order'),
    url(r'^vendor/acceptOrder/(?P<order_id>\d+)/$', vendor_views.accept_order, name='vendor_accept_order'),
    url(r'^vendor/rejectOrder/(?P<order_id>\d+)/$', vendor_views.reject_order, name='vendor_reject_order'),
    url(r'^vendor/newShippingOption/$', vendor_views.addShippingOption, name='vendor_list_new_shipping_option'),
    url(r'^vendor/saveNewShippingOption', vendor_views.saveNewShippingOption, name='user_vendor_saveNewShippingOption'),
    url(r'^vendor/listShippingOptions', vendor_views.listShippingOptions, name='user_vendor_listShippingOptions'),
    url(r'^vendor/editShippingOption/(?P<shipping_option_id>\d+)/$', vendor_views.editShippingOption, name='user_vendor_editShippingOption'),
    url(r'^vendor/updateShippingOption/$', vendor_views.updateShippingOption, name='user_vendor_updateShippingOption'),
    url(r'^vendor/deleteShippingOption/(?P<shipping_option_id>\d+)/$', vendor_views.deleteShippingOption, name='user_vendor_deleteShippingOption'),
    #seach url
    url(r'^search/$', product_views.search, name='search'),
    # path('accounts/', include('django.contrib.auth.urls')),

    url(r'^messages/$', product_views.UserMessageListView.as_view(), name='message_list'),

    #inbox url
    url(r'^inbox/$', product_views.UserInboxListView.as_view(), name='inbox_list'),
    url(r'^inbox/(?P<message_id>\d+)/delete/$', product_views.deleteMessage, name='inbox_delete_message'),
    url(r'^inbox/send/$', product_views.inbox_send, name='inbox_send'),
    url(r'^inbox/send/(?P<receiver_id>\d+)/$', product_views.inbox_send, name='inbox_send'),

    path('account/', include('accounts.urls')),
    url(r'^accounts/$', RedirectView.as_view(url='/account')),  # Redirects url "/accounts" to "/account"
    # url(r'^accounts/', include("accounts.passwords.urls")),

    # path('accounts/', include("accounts.passwords.urls")),
    path('cart/', include('cart.urls')),
    path('orders/', include('orders.urls')),
    path('', include('main.urls')),
    #star Rating Url
    url(r'^ratings/', include('star_ratings.urls', namespace='ratings')),
]

if settings.DEBUG:
    urlpatterns = urlpatterns + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns = urlpatterns + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
