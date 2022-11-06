
# Create your views here.
from django.http import Http404
from django.http import JsonResponse
from rest_framework import status
from rest_framework import generics
from .models import User, UserProfile
from .serializers import UserProfileSerializer, UserSerializer
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt

@method_decorator(csrf_exempt, name='dispatch')
class UserList(generics.ListCreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    
@method_decorator(csrf_exempt, name='dispatch')
class UserDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def get_user_by_email(self, email):
        try:
            user = User.objects.get(email=email)
            serializer = UserSerializer(user)
            return JsonResponse(serializer.data)
            
        except User.DoesNotExist:
            raise Http404

@method_decorator(csrf_exempt, name='dispatch')
class UserProfileList(generics.ListCreateAPIView):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer

@method_decorator(csrf_exempt, name='dispatch')
class UserProfileDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer

    def get_user_profile(self, pk):
        try:
            profile = UserProfile.objects.get(pk=pk)
            serializer = UserProfileSerializer(profile)
            return JsonResponse(serializer.data)
            
        except User.DoesNotExist:
            raise Http404
    