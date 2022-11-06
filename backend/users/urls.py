from django.urls import path
from users import views

urlpatterns = [
    path('users/', views.UserList.as_view()),
    path('users/username/<str:pk>/', views.UserDetail.as_view()),
    path('users/email/<str:email>/', views.UserDetail.get_user_by_email),
    path('user-profiles/', views.UserProfileList.as_view()),
    path('user-profiles/<str:pk>/', views.UserProfileDetail.get_user_profile),
    path('user-profiles/<str:pk>/update/', views.UserProfileDetail.as_view()),
]