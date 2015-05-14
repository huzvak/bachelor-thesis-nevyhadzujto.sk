# coding: utf-8
from forms import AdForm, ProfileForm, RegistrationForm #,AdImageForm
from django.core.mail import mail_managers
from django.shortcuts import render_to_response, RequestContext
from django.http import HttpResponseRedirect
from models import Ad, AdImage, City, Category, News, Profile
from django.contrib.auth.models import User
from django.db.models import Q
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage, InvalidPage
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django import forms
from django.core.mail import EmailMessage
#from datetime import datetime
from django.template.defaultfilters import slugify
import xml.etree.ElementTree as ET
from getXML import getXML
from math import floor
import unicodedata, time, datetime
from gmapi import maps
from gmapi.forms.widgets import GoogleMap

#the variable contains 3 newest ads for output on the pages
recentNews =  News.objects.all()[:3]

#getting information about Ads stored in the database
countInfo = {}
countInfo['allAds'] = Ad.objects.all().count()
countInfo['activeAds'] = Ad.objects.filter(active=True).count()
countInfo['allUsers'] = User.objects.all().count()

#getting information for form
formInfo = {}
formInfo['allCities'] = City.objects.all()
formInfo['allCategories'] = Category.objects.all()

#@param url_string:string - for which concrete URL the URLs are created 
#@param page:integer - number of page of URL
#@param page_size:integer - the size of the page (how many entries are shown on the page)
#@param num-pages:integer - how many pages the URL has
#@param url_str2:string - part of the URL which is sometimes used for creating some URLs
#@param search_url:string - URL from search form
#@return:array with urls which are then used in the output on the webpage
def makeUrls(url_string, page, page_size, num_pages, url_str2 = None, search_url = None):
    
    temp_array = {}
    
    if url_str2 == None and search_url == None:
        temp_array['crumbs'] = "/" + url_string + "/" + str(page) + "/" + str(page_size) + "/"
        temp_array['search_form'] = "/vyhladavanie/1/5/?search="
        temp_array['nav_first'] = "/" + url_string + "/1/" + str(page_size) + "/"
        temp_array['nav_prev'] = "/" + url_string + "/" + str(page - 1) + "/" + str(page_size) + "/"
        temp_array['nav_current'] = "/" + url_string + "/" + str(page) + "/" + str(page_size) + "/"
        temp_array['nav_next'] = "/" + url_string + "/" + str(page + 1) + "/" + str(page_size) + "/"
        temp_array['nav_last'] = "/" + url_string + "/" + str(num_pages) + "/" + str(page_size) + "/"
        
        temp_array['five'] = "/" + url_string + "/1/5/"
        temp_array['ten'] = "/" + url_string + "/1/10/"
        temp_array['twenty_five'] = "/" + url_string + "/1/25/"
        
    elif url_str2 == None and search_url != None:
        temp_array['crumbs'] = "/" + url_string + "/" + str(page) + "/" + str(page_size) + "/?search=" + search_url
        temp_array['search_form'] = "/" + url_string + "/1/" + str(page_size) + "/?search=" + search_url
        temp_array['nav_first'] = "/" + url_string + "/1/" + str(page_size) + "/?search=" + search_url
        temp_array['nav_prev'] = "/" + url_string + "/" + str(page - 1) + "/" + str(page_size) + "/?search=" + search_url
        temp_array['nav_current'] = "/" + url_string + "/" + str(page) + "/" + str(page_size) + "/?search=" + search_url
        temp_array['nav_next'] = "/" + url_string + "/" + str(page + 1) + "/" + str(page_size) + "/?search=" + search_url
        temp_array['nav_last'] = "/" + url_string + "/" + str(num_pages) + "/" + str(page_size) + "/?search=" + search_url
        
        temp_array['five'] = "/" + url_string + "/1/5/?search=" + search_url
        temp_array['ten'] = "/" + url_string + "/1/10/?search=" + search_url
        temp_array['twenty_five'] = "/" + url_string + "/1/25/?search=" + search_url
        
    else:
        temp_array['crumbs'] = "/" + url_string + "/" + url_str2 + "/" + str(page) + "/" + str(page_size) + "/"
        temp_array['search_form'] = "/vyhladavanie/1/5/?search="
        temp_array['nav_first'] = "/" + url_string + "/" + url_str2 + "/1/" + str(page_size) + "/"
        temp_array['nav_prev'] = "/" + url_string + "/" + url_str2 + "/" + str(page - 1) + "/" + str(page_size) + "/"
        temp_array['nav_current'] = "/" + url_string + "/" + url_str2 + "/" + str(page) + "/" + str(page_size) + "/"
        temp_array['nav_next'] = "/" + url_string + "/" + url_str2 + "/" + str(page + 1) + "/" + str(page_size) + "/"
        temp_array['nav_last'] = "/" + url_string + "/" + url_str2 + "/" + str(num_pages) + "/" + str(page_size) + "/"
        
        temp_array['five'] = "/" + url_string + "/" + url_str2 + "/1/5/"
        temp_array['ten'] = "/" + url_string + "/" + url_str2 + "/1/10/"
        temp_array['twenty_five'] = "/" + url_string + "/" + url_str2 + "/1/25/"

    return temp_array

#@param request:HTTPRequest
#@param page:integer - the number of the page
#@param page_size:integer - the size of the page (how many entries are shown on the page)
#@return:response to request, which is then used to shown in the appropriate template
def search_list(request, page = -1, page_size = -1):
    search = request.GET.get('search').decode('utf-8')
    search = request.GET.get('search')
    lokalita = str(request.POST.get('lokalita')).decode('utf-8')
    typ = str(request.POST.get('typ')).decode('utf-8')
    kategoria = str(request.POST.get('kategoria')).decode('utf-8')
    s_fotkou = str(request.POST.get('s_fotkou')).decode('utf-8')
    s_form = str(request.GET.get('s')).decode('utf-8')
    
    #test if form was submited 
    if s_form != "None":
        if request.session.get('search', False):
            del request.session['search']
        if request.session.get('lokalita', False):
            del request.session['lokalita']
        if request.session.get('typ', False):
            del request.session['typ']
        typ = u"vsetky"
        if request.session.get('kategoria', False):
            del request.session['kategoria']
        if request.session.get('s_fotkou', False):
            del request.session['s_fotkou']
    
    if(page == -1 and page_size == -1):
        return HttpResponseRedirect("/vyhladavanie/1/10/?search=" + search)
    
    page_size = int(page_size)
    page = int(page)

    sql_query = u"SELECT * FROM frontend_ad WHERE active=True"
    
    session_info = request.session.get('search', False)
    
    #depend of the type of request we handle variables and sessions
    if request.method == 'POST':
        if session_info:
            request.session['lokalita'] = lokalita
            request.session['typ'] = typ
            request.session['kategoria'] = kategoria
            request.session['s_fotkou'] = s_fotkou
        else:
            request.session['search'] = search
            request.session['lokalita'] = lokalita
            request.session['typ'] = typ
            request.session['kategoria'] = kategoria
            request.session['s_fotkou'] = s_fotkou
            
    else:
        search = request.GET.get('search').decode('utf-8')
        #search = request.GET.get('search')
        
        if session_info and str(request.session.get('search', False)).decode('utf-8') != search:
            del request.session['search']
            del request.session['lokalita']
            del request.session['typ']
            typ = u"vsetky"
            del request.session['kategoria']
            del request.session['s_fotkou']
        elif session_info or str(request.session.get('search', False)).decode('utf-8') == "":
            lokalita = request.session.get('lokalita', "cela-sr")
            typ = request.session.get('typ', None)
            kategoria = request.session.get('kategoria', "vsetky")
            s_fotkou = request.session.get('s_fotkou', None)
    
    #constructing the query depending on the submited info from the search and filter form
    if (request.method == 'POST' or 
        (request.method == 'GET' and session_info and str(request.session.get('search', False)).decode('utf-8') == search) or 
        (request.method == 'GET' and str(request.session.get('search', False)).decode('utf-8') == "")):
        if lokalita != u"cela-sr":
            sql_query += u" AND city_id=" + lokalita
        
        if kategoria != u"vsetky":
            sql_query += u" AND category_id=" + kategoria
        
        if typ != u"vsetky":
            if typ == u"ponuka":
                sql_query += u" AND type_of_ad=True"
            else:
                sql_query += u" AND type_of_ad=False"
        
        if s_fotkou == u"1":
            sql_query += u" AND id IN (SELECT ad_id FROM frontend_adimage)"

    if search is not None:
        sql_query += u" AND (text_of_ad ILIKE '%%" + search + u"%%' OR title ILIKE '%%" + search + u"%%')"
    
    ads_list = Ad.objects.raw(sql_query.encode('utf-8'))
    ads_count = sum(1 for result in ads_list)

    paginator = Paginator(ads_list, page_size)
    paginator._count = len(list(ads_list))

    try:
        ads = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        ads = paginator.page(1)
    except (EmptyPage, InvalidPage):
        # If page is out of range (e.g. 9999), deliver last page of results.
        ads = paginator.page(paginator.num_pages)
    
    if ads_count > 0:
        for ad in ads.object_list:
            ad_id = ad.id
            try:
                ad.image = AdImage.objects.filter(ad=ad_id)
            except IndexError:
                return HttpResponseRedirect('/')
    
    info_for_template = {}
    info_for_template['title'] = u"Výpis výsledkov pre vyhľadávaný reťazec " + search
    
    if(search == ""):
        info_for_template['title2'] = u"Výsledky vyhľadávania"
    else:
        info_for_template['title2'] = u"Výsledky vyhľadávania pre: " + search
    
    if(lokalita != "cela-sr" and lokalita != "None"):
        city_name = unicode(City.objects.filter(id=lokalita)[0])
        
        info_for_template['title'] = info_for_template['title'] + u" v meste " + city_name
        if(search == ""):
            info_for_template['title2'] = u"Výsledky vyhľadávania pre mesto " + city_name
    
    if(kategoria != "vsetky" and kategoria != "None"):
        category_name = unicode(Category.objects.filter(id=kategoria)[0])
        
        info_for_template['title'] = info_for_template['title'] + u", v kategórii " + category_name
        if(search == ""):
            if(lokalita == "cela-sr"):
                info_for_template['title2'] = u"Výsledky vyhľadávania pre kategóriu " + category_name
            else:
                city_name = unicode(City.objects.filter(id=lokalita)[0])
                info_for_template['title2'] = u"Výsledky vyhľadávania pre mesto " + city_name + u" a kategóriu " + category_name
    
    info_for_template['crumbs_text'] = u"Vyhľadávanie"
    info_for_template['ads_count'] = ads_count
    
    info_for_template.update(makeUrls("vyhladavanie", page, page_size, paginator.num_pages, None, search))
    
    cities = returnCitiesWithAds()

    return render_to_response('mesto.html', {'search': search, 'ads': ads, 'page_size': page_size, 
                                             'countInfo': countInfo, 'formInfo': formInfo,  
                                             'recentNews': recentNews, 'info_for_template': info_for_template, 
                                             'lokalita': lokalita, 'typ': typ, 'kategoria': kategoria, 
                                             's_fotkou': s_fotkou, 'cities': cities},
                              context_instance=RequestContext(request))

#@param forms.Form:reference to form
class MapForm(forms.Form):
    map = forms.Field(widget=GoogleMap(attrs={'width':610, 'height':310}))

#@param request:HTTPRequest
#@param ad_id:integer - id of ad of which detail should be shown
#@return:response to request, which is then used to shown in the appropriate template 
def ad_detail(request, ad_id):
    try:
        ad = Ad.objects.filter(id=ad_id)[0]
        category = Category.objects.filter(id=ad.category_id)[0]
        city = City.objects.filter(id=ad.city_id)[0]
        images = AdImage.objects.filter(ad=ad_id)
        
        ad.count_of_views = ad.count_of_views + 1
        if (ad.time_of_reservation == None or 
                ad.time_of_reservation.replace(day=ad.time_of_reservation.day + 2) <= datetime.datetime.now()):
            ad.time_of_reservation = None
            ad.reservation_id = None
        ad.save()
        
    except IndexError:
        return HttpResponseRedirect('/')
    
    gmap = maps.Map(opts = {

        'center': maps.LatLng(ad.latitude, ad.longitude),

        'mapTypeId': maps.MapTypeId.ROADMAP,

        'zoom': 6,

        'mapTypeControlOptions': {

             'style': maps.MapTypeControlStyle.DROPDOWN_MENU

        },

    })

    marker = maps.Marker(opts = {

        'map': gmap,

        'position': maps.LatLng(ad.latitude, ad.longitude),

    })

    maps.event.addListener(marker, 'mouseover', 'myobj.markerOver')

    maps.event.addListener(marker, 'mouseout', 'myobj.markerOut')

    info = maps.InfoWindow({

        'content': 'Hello!',

        'disableAutoPan': True

    })

    info.open(gmap, marker)
 
    try:
        previousAd = Ad.objects.filter(id__lt=ad_id).order_by('-id')[0]
    except IndexError:
        previousAd = None
    
    try:
        nextAd = Ad.objects.filter(id__gt=ad_id).order_by('id')[0]
    except IndexError:
        nextAd = None
    
    if ad.user == request.user:
        set_inactive = True
        set_registration = False
    else:
        set_inactive = False
        if ad.can_be_reservated:
            set_registration = True
        else:
            set_registration = False
            
    
    if User.objects.filter(id=ad.reservation_id).count() != 0:
        reservated_by = User.objects.filter(id=ad.reservation_id)
    else:
        reservated_by = {}
        reservated_by[0] = None

    remaining_time = {}
    if ad.reservation_id != None and ad.time_of_reservation != None:
        temp = ad.time_of_reservation.replace(day=ad.time_of_reservation.day + 2) - datetime.datetime.now()
        
        time_different = temp.days * (60*60*24) + temp.seconds
    
        hours = int(floor(time_different / 3600))
        minutes = int(floor((time_different - (hours * 3600)) / 60))
        seconds = int(floor((time_different - (hours * 3600) - (minutes * 60))))
        remaining_time['hours'] = hours
        remaining_time['minutes'] = minutes
        remaining_time['seconds'] = seconds
        
    return render_to_response('detail_inzeratu.html', {'ad': ad, 'city': city, 'category': category, 'images': images, 
                                                       'previousAd': previousAd, 'nextAd': nextAd, 'countInfo': countInfo, 
                                                       'recentNews': recentNews, 'set_inactive': set_inactive, 
                                                       'set_registration': set_registration, 'reservated_by': reservated_by[0], 
                                                       'remaining_time': remaining_time, 'form': MapForm(initial={'map': gmap})}, 
                              context_instance=RequestContext(request))

#@param request:HTTPRequest
#@param ad_id:integer - id of ad of which state should be changed
#@return:HttpResponseRedirect to pae with detail of ad 
@login_required(login_url='/')
def change_state(request, ad_id):
    try:
        ad = Ad.objects.filter(id=ad_id)[0]
    except IndexError:
        return HttpResponseRedirect('/')
    
    if ad.user == request.user:
        if ad.active == True:
            ad.active = False
            ad.save()
            messages.info(request, 'Bol zmenený stav inzerátu')
            return HttpResponseRedirect('/detail-inzeratu/' + ad_id + '/')
        else:
            ad.active = True
            ad.save()
            messages.info(request, 'Bol zmenený stav inzerátu')
            return HttpResponseRedirect('/detail-inzeratu/' + ad_id + '/')
    else:
        messages.error(request, 'Nemáte oprávnenie pre zmenu stavu tohto inzerátu')
        return HttpResponseRedirect('/detail-inzeratu/' + ad_id + '/')


#@param request:HTTPRequest
#@param ad_id:integer - id of ad of which state should be changed
#@return:HttpResponseRedirect to pae with detail of ad
@login_required(login_url='/')
def reserve(request, ad_id):
    try:
        ad = Ad.objects.filter(id=ad_id, active=True)[0]
    except IndexError:
        return HttpResponseRedirect('/')
    
    if ad.user != request.user:
        if ad.reservation_id == None and ad.can_be_reservated == True:
            ad.reservation_id = request.user.id
            ad.time_of_reservation = datetime.datetime.now()
            ad.save()
            messages.info(request, 'Inzerát bol úspešne zarezervovaný')
            
            mail_title = u'Inzerát "' + ad.title + u'" bol úspešne zarezervovaný'
            mail_text = u'Úspešne ste zarezervovali inzerát "' + ad.title + u'" patriaci užívateľovi: ' + ad.user.username
            
            mail_title2 = u'Váš inzerát "' + ad.title + u'" bol zarezervovaný'
            mail_text2 = u'Váš inzerát "' + ad.title + u'" bol úspešne zarezervovaný užívateľom: ' + request.user.username
            
            email = EmailMessage(mail_title, mail_text, to=['zdeno.z.popradu@seznam.cz'], 
                                 headers = {'Reply-To': ad.user.email} )
            email2 = EmailMessage(mail_title2, mail_text2, to=['zdeno.z.popradu@seznam.cz'], 
                                  headers = {'Reply-To': request.user.email} )
            
            email.send()
            email2.send()
            
            return HttpResponseRedirect('/detail-inzeratu/' + ad_id + '/')
        elif ad.can_be_reservated == True:
            messages.warning(request, 'Inzerát už je zarezervovaný')
            return HttpResponseRedirect('/detail-inzeratu/' + ad_id + '/')
        else:
            messages.warning(request, 'Autor tohto inzerátu nepovolil možnosť zarezevovania inzerátu. Kontaktujte ho na jeho e-mail.')
            return HttpResponseRedirect('/detail-inzeratu/' + ad_id + '/')
    
    else:
        messages.error(request, 'Nemôžete si zarezervovať inzerát, ktorý ste sám vytvorili')
        return HttpResponseRedirect('/detail-inzeratu/' + ad_id + '/')

#@param request:HttpRequest
#@param city_url:string url of city for which he should show list of ads
#@param page:integer - number of page
#@param page_size:integer - size of the page (how many entries are shown on 1 page)
#@return:response to request, which is then used to shown in the appropriate template
def city_list(request, city_url, page = -1, page_size = -1):
    if(page == -1 and page_size == -1):
        return HttpResponseRedirect("/mesto/" + city_url + "/1/10/")
    
    page_size = int(page_size)
    page = int(page)
    
    try:
        city = City.objects.filter(city_url=city_url)
        
        # Due to filter form - we want to show right city
        lokalita = str(city[0].id)
        
        ads_list = Ad.objects.filter(city=city, active=True)
        
        paginator = Paginator(ads_list, page_size)
        
        try:
            ads = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            ads = paginator.page(1)
        except (EmptyPage, InvalidPage):
            # If page is out of range (e.g. 9999), deliver last page of results.
            ads = paginator.page(paginator.num_pages)
        
        for ad in ads.object_list:
            ad_id = ad.id
            
            ad.image = AdImage.objects.filter(ad=ad_id)
        
        info_for_template = {}
        info_for_template['title'] = u"Výpis inzerátov pre mesto " + city[0].city
        info_for_template['title2'] = u"Inzeráty pre mesto " + city[0].city
        info_for_template['crumbs_text'] = city[0].city
        info_for_template['ads_count'] = ads_list.count()
        
        info_for_template.update(makeUrls("mesto", page, page_size, paginator.num_pages, city[0].city_url, None))
        
        cities = returnCitiesWithAds()
        
    except IndexError:
        return HttpResponseRedirect('/')
        
    return render_to_response('mesto.html', {'ads': ads, 'page_size': page_size, 'countInfo': countInfo, 'recentNews': recentNews, 
                                             'info_for_template': info_for_template, 'formInfo': formInfo, 'cities': cities, 
                                             'lokalita': lokalita}, 
                              context_instance=RequestContext(request))


#@param request:HttpRequest
#@param category_url:string url of category for which he should show list of ads
#@param page:integer - number of page
#@param page_size:integer - size of the page (how many entries are shown on 1 page)
#@return:response to request, which is then used to shown in the appropriate template
def category_list(request, category_url, page = -1, page_size = -1):
    if(page == -1 and page_size == -1):
        return HttpResponseRedirect("/kategoria/" + category_url + "/1/10/")
    
    page_size = int(page_size)
    page = int(page)
    
    try:
        category = Category.objects.filter(category_url=category_url)
        
        # Due to filter form - we want to show right category
        kategoria = str(category[0].id)
        
        ads_list = Ad.objects.filter(category=category, active=True)
        
        paginator = Paginator(ads_list, page_size)
        
        try:
            ads = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            ads = paginator.page(1)
        except (EmptyPage, InvalidPage):
            # If page is out of range (e.g. 9999), deliver last page of results.
            ads = paginator.page(paginator.num_pages)
        
        for ad in ads.object_list:
            ad_id = ad.id
            
            ad.image = AdImage.objects.filter(ad=ad_id)
            
        info_for_template = {}
        info_for_template['title'] = u"Výpis inzerátov pre kategóriu " + category[0].category
        info_for_template['title2'] = u"Inzeráty pre kategóriu " + category[0].category
        info_for_template['crumbs_text'] = category[0].category
        info_for_template['ads_count'] = ads_list.count()
        
        info_for_template.update(makeUrls("kategoria", page, page_size, paginator.num_pages, category[0].category_url, None))
        
        cities = returnCitiesWithAds()
        
    except IndexError:
        return HttpResponseRedirect('/')
        
    return render_to_response('mesto.html', {'ads': ads, 'page_size': page_size, 'countInfo': countInfo, 'recentNews': recentNews, 
                                             'info_for_template': info_for_template, 'formInfo': formInfo, 'cities': cities, 
                                             'kategoria': kategoria}, 
                              context_instance=RequestContext(request))

#@param request:HttpRequest
#@param username:string - the username, by using this username we should show list of ads of this user
#@param page:integer - number of page
#@param page_size:integer - size of the page (how many entries are shown on 1 page)
#@return:response to request, which is then used to shown in the appropriate template
def user_ads(request, username, page = -1, page_size = -1):
    if(page == -1 and page_size == -1):
        return HttpResponseRedirect("/uzivatel/" + username + "/1/10/")
    
    page_size = int(page_size)
    page = int(page)
    
    try:
        the_user = User.objects.get(username = username)
        
    except User.DoesNotExist:
        the_user = None
    
    if(the_user != None):
        try:
            ads_list = Ad.objects.filter(user=the_user, active=True)
            
            paginator = Paginator(ads_list, page_size)
            
            try:
                ads = paginator.page(page)
            except PageNotAnInteger:
                # If page is not an integer, deliver first page.
                ads = paginator.page(1)
            except (EmptyPage, InvalidPage):
                # If page is out of range (e.g. 9999), deliver last page of results.
                ads = paginator.page(paginator.num_pages)
        
            for ad in ads.object_list:
                ad_id = ad.id
            
                ad.image = AdImage.objects.filter(ad=ad_id)
                
            info_for_template = {}
            info_for_template['title'] = u"Výpis inzerátov užívateľa " + the_user.username
            info_for_template['title2'] = u"Inzeráty užívateľa " + the_user.username
            info_for_template['crumbs_text'] = u"Užívateľ " + the_user.username
            info_for_template['ads_count'] = ads_list.count()
            
            info_for_template.update(makeUrls("uzivatel", page, page_size, paginator.num_pages, the_user.username, None))
            
            cities = returnCitiesWithAds()
                
        except IndexError:
            return HttpResponseRedirect('/')

    return render_to_response('mesto.html', {'ads': ads, 'page_size': page_size, 'countInfo': countInfo, 'recentNews': recentNews, 
                                             'info_for_template': info_for_template, 'formInfo': formInfo, 'cities': cities}, 
                              context_instance=RequestContext(request))


#@param request:HttpRequest
#@param username:string - the username, by using this username we should show list of ads of this user, 
#but with more info than if user which is requesting the page is unlogged
#@param page:integer - number of page
#@param page_size:integer - size of the page (how many entries are shown on 1 page)
#@return:response to request, which is then used to shown in the appropriate template
@login_required(login_url='/')
def login_user_ads(request, username, page = -1, page_size = -1):
    if(page == -1 and page_size == -1):
        return HttpResponseRedirect("/prihlaseny-uzivatel/" + username + "/1/10/")
    
    page_size = int(page_size)
    page = int(page)
    
    try:
        the_user = User.objects.get(username = username)
        
    except User.DoesNotExist:
        the_user = None
    
    if(the_user != None):
        try:
            ads_list = Ad.objects.filter(user=the_user)
            
            paginator = Paginator(ads_list, page_size)
            
            try:
                ads = paginator.page(page)
            except PageNotAnInteger:
                # If page is not an integer, deliver first page.
                ads = paginator.page(1)
            except (EmptyPage, InvalidPage):
                # If page is out of range (e.g. 9999), deliver last page of results.
                ads = paginator.page(paginator.num_pages)
        
            for ad in ads.object_list:
                ad_id = ad.id
            
                ad.image = AdImage.objects.filter(ad=ad_id)
                
            info_for_template = {}
            info_for_template['title'] = u"Výpis inzerátov prihláseného užívateľa " + the_user.username
            info_for_template['title2'] = u"Inzeráty prihlaseného užívateľa " + the_user.username
            info_for_template['crumbs_text'] = u"Prihlásený užívateľ " + the_user.username
            info_for_template['ads_count'] = ads_list.count()
            
            info_for_template.update(makeUrls("prihlaseny-uzivatel", page, page_size, paginator.num_pages, the_user.username, None))
            
            cities = returnCitiesWithAds()
                
        except IndexError:
            return HttpResponseRedirect('/')

    return render_to_response('mesto.html', {'ads': ads, 'page_size': page_size, 'countInfo': countInfo, 'recentNews': recentNews, 
                                             'info_for_template': info_for_template, 'formInfo': formInfo, 'cities': cities}, 
                              context_instance=RequestContext(request))

#@param request:HttpRequest
#@param page:integer - number of page
#@param page_size:integer - size of the page (how many entries are shown on 1 page)
#@return:response to request, which is then used to shown in the appropriate template
def news(request, page = -1, page_size = -1):
    if(page == -1 and page_size == -1):
        return HttpResponseRedirect("/novinky/1/10/")
    
    page_size = int(page_size)
    page = int(page)
    
    try:
        news_list = News.objects.all()
        
        paginator = Paginator(news_list, page_size)
        
        try:
            news = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            news = paginator.page(1)
        except (EmptyPage, InvalidPage):
            # If page is out of range (e.g. 9999), deliver last page of results.
            news = paginator.page(paginator.num_pages)
        
        #because of compatibility with template: template is common for many views: search_list, news, ...
        for new in news.object_list:
            new.text_of_ad = new.text
        
        info_for_template = {}
        info_for_template['title'] = u"Výpis noviniek na NevyhadzujTo.sk"
        info_for_template['title2'] = u"Novinky na NevyhadzujTo.sk"
        info_for_template['crumbs_text'] = "Novinky"
        info_for_template['ads_count'] = news_list.count()
        
        info_for_template.update(makeUrls("novinky", page, page_size, paginator.num_pages, None, None))
        
        cities = returnCitiesWithAds()
        
    except IndexError:
        return HttpResponseRedirect('/')
    
    #news is in variable called ads - because of compatibility with template: template is common for many views: search_list, news, ...
    return render_to_response('mesto.html', {'ads': news, 'page_size': page_size, 'countInfo': countInfo, 'recentNews': recentNews, 
                                             'info_for_template': info_for_template, 'formInfo': formInfo, 'cities': cities}, 
                              context_instance=RequestContext(request))

#@param request:HttpRequest
#@param news_url:string - the url of news which detail should be shown
#@return:response to request, which is then used to shown in the appropriate template
def news_detail(request, news_url):
    
    try:
        news = News.objects.filter(title_url=news_url)[:1]
        news_id = news[0].id
    except IndexError:
        return HttpResponseRedirect('/')
    
    try:
        previousNew = News.objects.filter(id__lt=news_id)[0]
    except IndexError:
        previousNew = None
    
    try:
        nextNew = News.objects.filter(id__gt=news_id)[0]
    except IndexError:
        nextNew = None
        
    return render_to_response('detail-novinky.html', {'news': news, 'previousNew': previousNew, 'nextNew': nextNew, 
                                                       'countInfo': countInfo, 'recentNews': recentNews}, 
                              context_instance=RequestContext(request))

#@param request:HttpRequest
#@return:response to request, which is then used to shown in the appropriate template
def front_page(request):
    
    popularAds =  Ad.objects.order_by('-count_of_views')[:3]
    newAds =  Ad.objects.order_by('-time_of_publication')[:3]
    
    cities = returnCitiesWithAds()
    
    for ad in popularAds:
        ad_id = ad.id
            
        ad.image = AdImage.objects.filter(ad=ad_id)
    
    for ad in newAds:
        ad_id = ad.id
            
        ad.image = AdImage.objects.filter(ad=ad_id)
    
    return render_to_response('front_page.html', {'cities': cities, 'popularAds': popularAds, 'newAds': newAds, 
                                                  'countInfo': countInfo, 'recentNews': recentNews, 'formInfo': formInfo}, 
                              context_instance=RequestContext(request))


#@return:collection of cities which have at least 1 ad
def returnCitiesWithAds():
    cities = City.objects.all()
    
    for city in cities:
        city_id = city.id
            
        city.count = Ad.objects.filter(city=city_id).count()
    
    return cities

#@param request:HttpRequest
#@return:HttpResponseRedirect
def user_login(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            login(request, user)
            return HttpResponseRedirect('/')
        else:
            # Return a 'disabled account' error message
            messages.warning(request, 'Tento užívateľsky účet je neaktívny')
            return HttpResponseRedirect('/')
    else:
        # Return an 'invalid login' error message.
        messages.error(request, 'Nesprávne zadané uživateľské meno alebo heslo. Skúste to znovu.')
        return HttpResponseRedirect('/')

#@param request:HttpRequest
#@return:HttpResponseRedirect
def user_logout(request):
    logout(request)
    return HttpResponseRedirect('/')

#@param request:HttpRequest
#@return:HttpResponseRedirect or response to request, which is then used to shown in the appropriate template 
def registration(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)

        if form.is_valid():
            user = User.objects.create_user(form.cleaned_data['username'], form.cleaned_data['email'], form.cleaned_data['password1'])
            user.first_name = form.cleaned_data['first_name']
            user.last_name = form.cleaned_data['last_name']
            user.save()

            profile = Profile(user_id=user.id, phone=form.cleaned_data['phone'])
            profile.save()
            messages.info(request, 'Registrácia prebehla úspešne')

            return HttpResponseRedirect('/')
    else:
        form = RegistrationForm()
    
    page_info = {}
    page_info['title'] = 'Registrácia nového uživateľa'
    page_info['page'] = 1
    page_info['form_name'] = 'registration'
    page_info['form_action'] = '/registracia/'
    
    return render_to_response('registracia.html', {'form': form, 'countInfo': countInfo, 'recentNews': recentNews, 
                                                   'page_info': page_info}, 
                              context_instance=RequestContext(request))

#@param request:HttpRequest
#@return:response to request, which is then used to shown in the appropriate template
@login_required
def profile(request):
    try:
        profile = request.user.get_profile()
    except Profile.DoesNotExist:
        profile = Profile(user=request.user)

    if request.method == 'POST':
        form = ProfileForm(request.POST)

        if form.is_valid():
            request.user.first_name = form.cleaned_data['first_name']
            request.user.last_name = form.cleaned_data['last_name']
            request.user.email = form.cleaned_data['email']

            if len(form.cleaned_data['password1']) > 0:
                request.user.set_password(form.cleaned_data['password1'])

            request.user.save()

            profile.phone = form.cleaned_data['phone']
            profile.save()
            
            messages.info(request, 'Vaše informácie boli upravené')

            return HttpResponseRedirect('/')
    else:
        form = ProfileForm(initial={'first_name': request.user.first_name,
                                    'last_name': request.user.last_name,
                                    'email': request.user.email,
                                    'phone': profile.phone,
                                    })
    page_info = {}
    page_info['title'] = 'Informácie o Vás - Váš profil'
    page_info['page'] = 0
    page_info['form_name'] = 'settings'
    page_info['form_action'] = '/nastavenia/'

    return render_to_response('registracia.html', {'form': form, 'countInfo': countInfo, 'recentNews': recentNews, 
                                               'page_info': page_info}, 
                              context_instance=RequestContext(request))



#@param request:HttpRequest
#@return:HttpResponseRedirect or response to request, which is then used to shown in the appropriate template
@login_required
def new_ad(request):
    if request.method == 'POST':
        form = AdForm(request.POST, request.FILES)

        if form.is_valid():
            title_url = title_url1 = slugify(form.cleaned_data['title'])
            tmp = 0
            while Ad.objects.filter(title_url=title_url1).count() > 0:
                tmp += 1
                title_url1 = title_url + '-' + str(tmp)
            title_url = title_url1
            
            ad = Ad(user_id=request.user.id, title = form.cleaned_data['title'])
            ad.city = form.cleaned_data['city']
            ad.address = form.cleaned_data['address']
            ad.psc = form.cleaned_data['psc']
            ad.category = form.cleaned_data['category']
            ad.text_of_ad = form.cleaned_data['text_of_ad']
            ad.type_of_ad = form.cleaned_data['type_of_ad']
            ad.is_new = form.cleaned_data['is_new']
            ad.is_antique = form.cleaned_data['is_antique']
            ad.is_inventory = form.cleaned_data['is_inventory']
            ad.can_be_reservated = form.cleaned_data['can_be_reservated']
            ad.time_of_publication = datetime.datetime.now()
            ad.title_url = title_url
            
            ad.latitude, ad.longitude = getGPS(ad.address, ad.city.city, ad.psc)
            ad.save()
            
            if form.cleaned_data['image1'] != None:
                image1 = AdImage(ad_id=ad.id, image=form.cleaned_data['image1'])
                image1.save()
            if form.cleaned_data['image2'] != None:
                image2 = AdImage(ad_id=ad.id, image=form.cleaned_data['image2'])
                image2.save()
            if form.cleaned_data['image3'] != None:
                image3 = AdImage(ad_id=ad.id, image=form.cleaned_data['image3'])
                image3.save()
            if form.cleaned_data['image4'] != None:
                image4 = AdImage(ad_id=ad.id, image=form.cleaned_data['image4'])
                image4.save()
            
            messages.info(request, 'Vaše inzerát bol pridaný')

            return HttpResponseRedirect('/')
    else:
        form = AdForm(initial={'type_of_ad': True})
    page_info = {}
    page_info['title'] = 'Informácie o Vás - Váš profil'
    page_info['page'] = 0
    page_info['form_name'] = 'new_ad'
    page_info['form_action'] = '/pridat-inzerat/'

    return render_to_response('pridaj_inzerat.html', {'form': form, 'countInfo': countInfo, 'recentNews': recentNews, 
                                               'page_info': page_info}, 
                              context_instance=RequestContext(request))

#@param address:string
#@param city:string
#@param psc:string
#@return: double: latitude and double:longitude
def getGPS(address = None, city = None, psc = None):
    
    url = u"http://maps.googleapis.com/maps/api/geocode/xml?"
    
    address = address + ", " + city + ", " + psc
    
    url = url + u"address=" + address + u"&sensor=false&language=sk"
    
    tree = getXML().run(url)
    rootElement = tree.getroot()
    
    if rootElement.find('status').text != 'OK':
        return None, None
    
    latitude = rootElement.find('result').find('geometry').find('location').find('lat').text
    longitude = rootElement.find('result').find('geometry').find('location').find('lng').text
    
    return latitude, longitude
    
