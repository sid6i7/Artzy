from django.db import models
from django.http import Http404
# Create your models here.
class User(models.Model):

    is_artist = models.BooleanField(default=False)
    username = models.CharField(max_length=20, unique=True, primary_key=True)
    email = models.CharField(max_length=50, unique=True)
    phone_number = models.CharField(max_length=13, unique=True)
    created_on = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.username

class UserProfile(models.Model):
    GENDERS = (
        ('M', "Male"),
        ('F', "Female"),
        ('O', "Other"),
        ('N', "Prefer not to say")
    )
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    bio = models.TextField(max_length=500, blank=True)
    gender = models.CharField(max_length=1, choices = GENDERS, default = "N")
    address = models.CharField(max_length=300, blank=True, null=True)
    profile_picture = models.ImageField(upload_to='profile_pics', blank=True, null=True)

    def __str__(self):
        return self.user.username
