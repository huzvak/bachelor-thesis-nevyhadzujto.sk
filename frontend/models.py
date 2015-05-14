# coding: utf-8
from django.db import models
from sorl.thumbnail import ImageField
from django.contrib.auth.models import User

#Model definition for model Profile
class Profile(models.Model):
    user = models.OneToOneField(User, verbose_name='Užívateľ')
    phone = models.CharField('Telefón', blank=True, default=None, max_length=20)

    def __unicode__(self):
        return self.user.username

    class Meta:
        verbose_name = 'profil'
        verbose_name_plural = 'profily'

#Model definition for model City
class City(models.Model):
    city = models.CharField('Mesto', max_length=100)
    city_url = models.SlugField('Mesto - url', max_length=100, unique=True)
    city_lokal = models.CharField('Mesto - lokál', max_length=100)
    
    def __unicode__(self):
        return self.city
    
    class Meta:
        ordering = ['city']
        verbose_name = 'mesto'
        verbose_name_plural = 'mestá'

#Model definition for model Category
class Category(models.Model):
    category = models.CharField('Kategória', max_length=100)
    category_url = models.SlugField('Kategória - url', max_length=100, unique=True)
    description = models.CharField('Popis', max_length=100)
    parent = models.ForeignKey('self', verbose_name='Nadradená kategória', related_name="father", null=True, blank=True, default=None)
    
    def __unicode__(self):
        return self.category
    
    class Meta:
        ordering = ['category']
        verbose_name = 'kategória'
        verbose_name_plural = 'kategórie'

#Model definition for model News
class News(models.Model):
    user = models.ForeignKey('auth.User', verbose_name='Vytvoril')
    title = models.CharField('Titulok', max_length=255)
    title_url = models.SlugField('Titulok - url', max_length=255, unique=True)
    text = models.TextField('Text novinky')
    time_of_publication = models.DateTimeField('Dátum uverejnenia', auto_now=True)
    
    def __unicode__(self):
        return self.title
    
    class Meta:
        ordering = ['time_of_publication']
        verbose_name = 'novinka'
        verbose_name_plural = 'novinky'

#Model definition for model Banner
class Banner(models.Model):
    title = models.CharField('Názov', max_length=100)
    description = models.CharField('Popis', max_length=255, null=True, blank=True, default=None)
    banner_url = models.URLField('URL bannera', max_length=255)
    target_url = models.URLField('Cieľova URL', max_length=255)
    from_date = models.DateField('Dátum spustenia')
    to_date = models.DateField('Dátum ukončenia')
    
    def __unicode__(self):
        return self.title
    
    class Meta:
        ordering = ['to_date']
        verbose_name = 'banner'
        verbose_name_plural = 'bannery'


BOOL_CHOICES = ((True, 'Darujem'), (False, 'Zháňam'))
RESERVATION_CHOICES = ((True, 'Povoliť'), (False, 'Nepovoliť'))

#Model definition for model Ad
class Ad(models.Model):
    user = models.ForeignKey('auth.User', verbose_name='Pridal', related_name="created_by")
    title = models.CharField('Titulok', max_length=255)
    title_url = models.SlugField('URL titulku', max_length=255, unique=True)
    city = models.ForeignKey('City', verbose_name='Mesto')
    address = models.CharField('Adresa - ulica a číslo domu', max_length=255, blank=False)
    psc = models.CharField('PSČ', max_length=6, default=0, blank=False)
    category = models.ForeignKey('Category', verbose_name='Kategória')
    text_of_ad = models.TextField('Text inzerátu')
    type_of_ad = models.BooleanField('Typ inzerátu', choices=BOOL_CHOICES)
    is_new = models.BooleanField('Vec je ako nová')
    is_antique = models.BooleanField('Starožitnosť')
    is_inventory = models.BooleanField('Firemný inventára')
    time_of_publication = models.DateTimeField('Dátum uverejnenia')
    count_of_views = models.IntegerField('Počet zhliadnuti', default=0)
    count_of_plus = models.IntegerField('Počet plusiek', default=0)
    count_of_minus = models.IntegerField('Počet mínusiek', default=0)
    reservation = models.ForeignKey('auth.User', verbose_name='Zarezervoval', related_name="reserved_by", null=True, blank=True, default=None)
    latitude = models.FloatField('Zemepisná šírka', default=0)
    longitude = models.FloatField('Zemepisná dĺžka', default=0)
    active = models.BooleanField('Aktívny inzerát', default=True)
    can_be_reservated = models.BooleanField('Možnosť zarezervovania', choices=RESERVATION_CHOICES, default=True)
    time_of_reservation = models.DateTimeField('Dátum zarezervovania', default=None, blank=True)
    
    
    def __unicode__(self):
        return self.title
    
    class Meta:
        ordering = ['time_of_publication']
        verbose_name = 'inzerát'
        verbose_name_plural = 'inzeráty'

#Model definition for model AdImage
class AdImage(models.Model):
    ad = models.ForeignKey('Ad', verbose_name='Inzerát', related_name = 'images')
    image = ImageField('Obrázok', upload_to='img/ads/')
    
    def __unicode__(self):
        return self.image.name
    
    class Meta:
        verbose_name = 'obrázok'
        verbose_name_plural = u'obrázky'