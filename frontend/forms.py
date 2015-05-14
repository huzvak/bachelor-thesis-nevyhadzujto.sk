# coding: utf-8
from django import forms
from models import AdImage
from models import Ad
from django.contrib.auth.models import User

#class to generate profile form
class ProfileForm(forms.ModelForm):
    phone = forms.CharField(label='Telefón', required=False)
    password1 = forms.CharField(label='Heslo', widget=forms.PasswordInput, required=False)
    password2 = forms.CharField(label='Heslo znovu', widget=forms.PasswordInput, required=False)

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email')

    def clean_password2(self):
        if self.cleaned_data.get('password1') != self.cleaned_data['password2']:
            raise forms.ValidationError('Zadané hesla sú odlišné.')

        return self.cleaned_data['password2']

#class to generate registration form
class RegistrationForm(forms.ModelForm):
    phone = forms.CharField(label='Telefón', required=False)
    password1 = forms.CharField(label='Heslo', widget=forms.PasswordInput, required=True)
    password2 = forms.CharField(label='Heslo znovu', widget=forms.PasswordInput, required=True)

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')

    def clean_password2(self):
        if self.cleaned_data.get('password1') != self.cleaned_data['password2']:
            raise forms.ValidationError('Zadané hesla sú odlišné.')

        return self.cleaned_data['password2']

#class to generate form for add new ad
class AdForm(forms.ModelForm):
    image1 = forms.FileField(label='Hlavný obrázok', required=False)
    image2 = forms.FileField(label='Ďalší obrázok 1', required=False)
    image3 = forms.FileField(label='Ďalší obrázok 1', required=False)
    image4 = forms.FileField(label='Ďalší obrázok 1', required=False)

    class Meta:
        model = Ad
        fields = ('title', 'city', 'address', 'psc', 'category', 'text_of_ad', 'type_of_ad', 'is_new', 
                  'is_antique', 'is_inventory', 'can_be_reservated')

#class to generate user form
class UserForm(forms.ModelForm):
    class Meta:
        model = User
        exclude = ('is_staff', 'is_active', 'is_superuser', 'last_login', 'date_joined')