from django.conf.urls.defaults import patterns, include, url
from django.conf import settings
from django.contrib import admin
from nevyhadzujto.frontend.models import Ad

admin.autodiscover()

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'nevyhadzujto.views.home', name='home'),
    # url(r'^nevyhadzujto/', include('nevyhadzujto.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)

ads = {
    'queryset': Ad.objects.order_by('-time_of_publication'),
    'template_name': 'vyhladavanie.html',
}

urlpatterns += patterns('', 
    ('^admin/', include(admin.site.urls)),
    (r'^$', 'frontend.views.front_page'),
    
    (r'^pridat-inzerat/$', 'frontend.views.new_ad'),
    (r'', include('gmapi.urls.media')),
    (r'^detail-inzeratu/(\d+)/$', 'frontend.views.ad_detail'),

    (r'^vyhladavanie/(\d+)/(\d+)/', 'frontend.views.search_list'),
    (r'^vyhladavanie/(\d+)/', 'frontend.views.search_list'),
    (r'^vyhladavanie/', 'frontend.views.search_list'),
    
    (r'^registracia/', 'frontend.views.registration'),
    (r'^nastavenia/', 'frontend.views.profile'),
    
    (r'^mesto/(|[a-z-]+)/(\d+)/(\d+)/$', 'frontend.views.city_list'),
    (r'^mesto/(|[a-z-]+)/(\d+)/$', 'frontend.views.city_list'),
    (r'^mesto/(|[a-z-]+)/$', 'frontend.views.city_list'),
    
    (r'^detail-novinky/(|[a-z-]+)/$', 'frontend.views.news_detail'),
    (r'^novinky/(\d+)/(\d+)/$', 'frontend.views.news'),
    (r'^novinky/(\d+)/$', 'frontend.views.news'),
    (r'^novinky/$', 'frontend.views.news'),
    
    (r'^kategoria/(|[a-z-]+)/(\d+)/(\d+)/$', 'frontend.views.category_list'),
    (r'^kategoria/(|[a-z-]+)/(\d+)/$', 'frontend.views.category_list'),
    (r'^kategoria/(|[a-z-]+)/$', 'frontend.views.category_list'),
    
    (r'^uzivatel/(|[a-z-_]+)/(\d+)/(\d+)/$', 'frontend.views.user_ads'),
    (r'^uzivatel/(|[a-z-_]+)/(\d+)/$', 'frontend.views.user_ads'),
    (r'^uzivatel/(|[a-z-_]+)/$', 'frontend.views.user_ads'),
    (r'^prihlaseny-uzivatel/(|[a-z-_]+)/(\d+)/(\d+)/$', 'frontend.views.login_user_ads'),
    (r'^prihlaseny-uzivatel/(|[a-z-_]+)/(\d+)/$', 'frontend.views.login_user_ads'),
    (r'^prihlaseny-uzivatel/(|[a-z-_]+)/$', 'frontend.views.login_user_ads'),
    
    (r'^i18n/', include('django.conf.urls.i18n')),
    
    (r'^prihlas-ma/$', 'frontend.views.user_login'),
    (r'^odhlas-ma/$', 'frontend.views.user_logout'),
    
    (r'^zmenit-stav/(\d+)/', 'frontend.views.change_state'),
    (r'^rezervovat/(\d+)/', 'frontend.views.reserve'),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^%s(?P<path>.*)$' % settings.MEDIA_URL[1:],
         'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}
        ),
    )