# Generated by Django 2.2 on 2024-06-18 17:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('weatherapp', '0004_weather_emailid'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='weather',
            name='Emailid',
        ),
    ]
