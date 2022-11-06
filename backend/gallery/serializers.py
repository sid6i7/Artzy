from rest_framework import serializers
from .models import Artwork, Category, Gallery

class GallerySerializer(serializers.ModelSerializer):
    class Meta:
        model = Gallery
        fields = ('owner', 'name', 'description', 'profile_picture', 'banner_picture')

class ArtworkSerializer(serializers.ModelSerializer):
    class Meta:
        model = Artwork
        fields = ('gallery', 'image', 'title', 'category', 'description')

