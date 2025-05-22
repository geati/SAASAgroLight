from django.urls import path, include
from users.views import login_view, register
from rest_framework.routers import DefaultRouter
from .views import UsuarioViewSet, solicitar_redefinicao, redefinir_senha

router = DefaultRouter()
router.register(r'usuarios', UsuarioViewSet)

urlpatterns = [
    path('login', login_view, name='login_view'),
    path('register', register, name='register'),
    path('', include(router.urls)),
]