from django.urls import path
from . import views

urlpatterns = [
    path('galleries/', views.GalleryList.as_view()),
    path('galleries/<str:pk>/', views.GalleryDetail.get_gallery),
    path('galleries/<str:pk>/update/', views.GalleryDetail.as_view()),
    path('artworks/', views.ArtworkList.as_view()),
    path('gallery/artworks/<str:gallery>/', views.ArtworkDetail.get_gallery_artworks),
    path('artworks/<str:pk>/update/', views.ArtworkDetail.as_view()),
    path('gallery/owner/<str:name>/', views.GalleryDetail.get_gallery_by_owner_name),
    path('search/<str:search>/', views.ArtworkDetail.search_for_artwork),
]