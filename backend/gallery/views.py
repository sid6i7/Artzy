from django.http import Http404
from django.http import JsonResponse
from rest_framework import generics
from .models import Gallery, Artwork
from .serializers import GallerySerializer, ArtworkSerializer

# Create your views here.
class GalleryList(generics.ListCreateAPIView):
    queryset = Gallery.objects.all()
    serializer_class = GallerySerializer

class GalleryDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Gallery.objects.all()
    serializer_class = GallerySerializer

    def get_gallery(self, pk):
        try:
            gallery = Gallery.objects.get(pk=pk)
            serializer = GallerySerializer(gallery)
            return JsonResponse(serializer.data)
            
        except Gallery.DoesNotExist:
            raise Http404
    
    def get_gallery_by_owner_name(self, name):
        try:
            gallery = Gallery.objects.get(owner=name)
            serializer = GallerySerializer(gallery)
            return JsonResponse(serializer.data)
            
        except Gallery.DoesNotExist:
            raise Http404

class ArtworkList(generics.ListCreateAPIView):
    queryset = Artwork.objects.all()
    serializer_class = ArtworkSerializer

class ArtworkDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Artwork.objects.all()
    serializer_class = ArtworkSerializer

    def search_for_artwork(self, search):
        try:
            gallery = Artwork.objects.filter(title__icontains=search)
            serializer = ArtworkSerializer(gallery, many=True)
            return JsonResponse(serializer.data, safe=False)
            
        except Gallery.DoesNotExist:
            raise Http404

    def get_gallery_artworks(self, gallery):
        try:
            artworks = Artwork.objects.filter(gallery=gallery)
            serializer = ArtworkSerializer(artworks, many=True)
            return JsonResponse(serializer.data, safe=False)
            
        except Artwork.DoesNotExist:
            raise Http404

    def get_artwork(self, pk):
        try:
            artwork = Artwork.objects.get(pk=pk)
            serializer = ArtworkSerializer(artwork)
            return JsonResponse(serializer.data)
            
        except Artwork.DoesNotExist:
            raise Http404
