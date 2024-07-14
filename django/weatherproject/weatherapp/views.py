from django.shortcuts import render
from django.contrib import messages
import requests
import datetime
from weatherapp.models import Weather,Contact
from django.core.mail import send_mail

def about(request):
     return render(request,'weatherapp/about.html')

def contact(request):
     name = request.POST.get('name','')
     email = request.POST.get('email','')
     subject = request.POST.get('subject','')
     message = request.POST.get('message','')
     if name:
          en = Contact(Name=name, Email=email, Subject=subject, Message=message)
          en.save()
     if email:
          send_mail(
               f'Django Weather Team ',
               f"""
Hello {email},

Thank you for your response.

Regards,
Django Weather Team 
               """,
               'django.weather1@gmail.com',
               [email],
               fail_silently=False,
          )

     return render(request,'weatherapp/contact.html')

def home(request):
     if 'city' in request.POST:
          city = request.POST['city']
     else:
          city = 'pune'
     url = f'https://api.openweathermap.org/data/2.5/weather?q={city}&appid='


     PARAMS = {'units':'metric'}

     API_KEY =  ''
     SEARCH_ENGINE_ID = 'f0d490b2a58954ce1'
     query = city + " 1920x1080"
     page = 1
     start = (page - 1) * 10 + 1
     searchType = 'image'
     city_url = f"https://www.googleapis.com/customsearch/v1?key={API_KEY}&cx={SEARCH_ENGINE_ID}&q={query}&start={start}&searchType={searchType}&imgSize=xlarge"

     data = requests.get(city_url).json()
     count = 1
     search_items = data.get("items")
     image_url = search_items[1]['link']

     try:
          data = requests.get(url,params=PARAMS).json()
          description = data['weather'][0]['description']
          icon = data['weather'][0]['icon']
          temp = data['main']['temp']
          day = datetime.date.today()
          en = Weather(Date=day, City_name=city, Temperature=temp, Description = description)
          en.save()
          return render(request,'weatherapp/home.html' , {'description':description , 'icon':icon ,'temp':temp , 'day':day , 'city':city , 'exception_occurred':False,'image_url':image_url})
     except KeyError:
          exception_occurred = True
          messages.error(request,'Entered data is not available to API')   
          day = datetime.date.today()
          return render(request,'weatherapp/home.html' ,{'description':'clear sky', 'icon':'01d'  ,'temp':25 , 'day':day , 'city':'pune' , 'exception_occurred':exception_occurred } )