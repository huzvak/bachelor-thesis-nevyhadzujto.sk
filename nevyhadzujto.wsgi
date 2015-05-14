import os, sys, site

site.addsitedir('/var/www/huzvak/python/nevyhadzujto/lib/python2.6/site-packages/')
sys.path.append('/var/www/huzvak/python/')
sys.path.append('/var/www/huzvak/python/nevyhadzujto')
os.environ['DJANGO_SETTINGS_MODULE'] = 'nevyhadzujto.settings'

from django.core.handlers import wsgi

application = wsgi.WSGIHandler()
