from django.contrib import admin
from .models import *
# Register your models here.
admin.site.register(Gallery)
admin.site.register(Category)
admin.site.register(Request)
admin.site.register(Artwork)