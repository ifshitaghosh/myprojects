from django.contrib import admin
from weatherapp.models import Weather, Contact

class WeatherAdmin(admin.ModelAdmin):
    list_display=('Date','City_name','Temperature','Description')

class ContactAdmin(admin.ModelAdmin):
    list_display=('Name','Email','Subject','Message')

admin.site.register(Weather,WeatherAdmin)
admin.site.register(Contact,ContactAdmin)
