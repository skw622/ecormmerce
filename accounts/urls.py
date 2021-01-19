from django.urls import path, include
from django.conf.urls import url

from . import views as account_views
from orders import views as order_views

urlpatterns = [
    path('', include("accounts.passwords.urls")),
    path('accounts/', include('django.contrib.auth.urls')),

    # url(r'^profile/update/pgp-key/$', account_views.UserPgpUpdateView.as_view(), name='user_pgp_update'),

    url(r'^profile/update/changeterms/$', account_views.Changeterms.as_view(), name='changeterms'),
    url(r'^profile/update/pgp-key/$', account_views.UserPgpUpdateView.as_view(), name='user_pgp_update'),
    url(r'^profile/$', account_views.UserProfileView.as_view(), name='user_profile'),
    url(r'^profile/favorite/$', account_views.favorite_detail, name='user_favorites'),
    url(r'^profile/ratings/$', account_views.user_ratings, name='user_ratings'),
    url(r'^profile/get_vendor_stats/$', account_views.get_vendor_stats, name='get_vendor_stats'),


    # User Order(s)
    url(r'^orders/$', account_views.UserOrdersListView.as_view(), name='user_order_list'),
    url(r'^orders/(?P<order_id>\d+)/$', account_views.UserOrderDetailView.as_view(), name='user_order_detail'),
    url(r'^completeOrder/(?P<order_id>\d+)/$', account_views.complete_order, name='user_order_complete'),
    url(r'^disputeOrder/(?P<order_id>\d+)/$', account_views.dispute_order, name='user_order_dispute'),
    url(r'^waiting/(?P<order_id>\d+)/(?P<addres>[-\w]+)/(?P<cost>\d+\.\d{8})$', order_views.waiting, name='waiting'),
]
