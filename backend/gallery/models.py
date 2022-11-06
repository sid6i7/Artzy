from django.db import models

from users.models import User

# Create your models here.

class Gallery(models.Model):
    name = models.CharField(max_length=30, primary_key=True)
    owner = models.OneToOneField(User, on_delete=models.CASCADE)
    description = models.TextField(max_length=1300, blank=True)
    profile_picture = models.ImageField(upload_to='gallery_profile_pics', blank=True, null=True)
    banner_picture = models.ImageField(upload_to='gallery_banner_pics', blank=True, null=True)

    def __str__(self):
        return self.name

class Category(models.Model):
    name = models.CharField(max_length=20, primary_key=True)

    def __str__(self):
        return self.name

class Request(models.Model):

    STATUS = (
        ('P', 'Pending'),
        ('A', 'Accepted'),
        ('R', 'Rejected')
    )

    artist = models.OneToOneField(User, on_delete=models.CASCADE, related_name='artist')
    enthusiast = models.OneToOneField(User, on_delete=models.CASCADE, related_name='enthusiast')
    created_on = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=1, choices=STATUS, default='P')

    def __str__(self):
        return self.artist + " - " + self.enthusiast

class Artwork(models.Model):
    gallery = models.ForeignKey(Gallery, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='artist_works', blank=True, null=True)
    title = models.CharField(max_length=40)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    description = models.TextField(max_length=230, blank=True, null=True)
    
    def __str__(self):
        return self.title