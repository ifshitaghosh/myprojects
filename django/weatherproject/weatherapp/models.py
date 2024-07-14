from django.db import models


class Weather(models.Model):
    Date=models.DateField()
    City_name = models.CharField(max_length=50)
    Temperature = models.CharField(max_length=50)
    Description=models.CharField(max_length=150)


class Contact(models.Model):
    Name=models.CharField(max_length=50)
    Email = models.EmailField(max_length=100)
    Subject = models.CharField(max_length=100)
    Message=models.TextField()