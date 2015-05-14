from django.contrib import admin
from models import City, Category, News, Banner, Ad, AdImage

#class adding City functionality into the administration
class CityAdmin(admin.ModelAdmin):
    prepopulated_fields = {'city_url': ('city',)}
    list_display = ('city', 'city_url', 'city_lokal')
    search_fields = ['city']

#registration of City functionality as CityAdmin into the administration
admin.site.register(City, CityAdmin)

#class adding Category functionality into the administration
class CategoryAdmin(admin.ModelAdmin):
    prepopulated_fields = {'category_url': ('category',)}
    list_display = ('category', 'category_url', 'description', 'parent')
    list_filter = ('parent',)
    search_fields = ['category']

#registration of Category functionality as CategoryAdmin into the administration
admin.site.register(Category, CategoryAdmin)

#class adding News functionality into the administration
class NewsAdmin(admin.ModelAdmin):
    prepopulated_fields = {'title_url': ('title',)}
    list_display = ('title', 'title_url', 'text', 'time_of_publication', 'user')
    list_filter = ('user',)
    search_fields = ['title', 'text', 'time_of_publication', 'user']

#registration of News functionality as NewsAdmin into the administration
admin.site.register(News, NewsAdmin)

#class adding Banner functionality into the administration
class BannerAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'banner_url', 'target_url', 'from_date', 'to_date')
    search_fields = ['title', 'description', 'from_date', 'to_date']

#registration of Banner functionality as BannerAdmin into the administration
admin.site.register(Banner, BannerAdmin)

#class adding Ad functionality into the administration
class AdAdmin(admin.ModelAdmin):
    prepopulated_fields = {'title_url': ('title',)}
    list_display = ('title', 'text_of_ad', 'city', 'address', 'category', 'type_of_ad', 'psc', 'count_of_views', 'user', 'reservation')
    list_filter = ('user', 'reservation', 'city', 'category', 'type_of_ad')
    search_fields = ['title', 'city', 'category', 'text_of_ad']

#registration of Ad functionality as AdAdmin into the administration
admin.site.register(Ad, AdAdmin)

#class adding AdImage functionality into the administration
class AdImageAdmin(admin.ModelAdmin):
    list_display = ('ad', 'image')
    list_filter = ('ad',)
    search_fields = ['ad']

#registration of AdImage functionality as AdImageAdmin into the administration
admin.site.register(AdImage, AdImageAdmin)