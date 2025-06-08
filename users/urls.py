from django.urls import path, include
from users.views import login_view, register, usuario_logado, api_login, UsuarioViewSet
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'usuarios', UsuarioViewSet, basename='usuario')

urlpatterns = [
    path('login', login_view, name='login_view'),
    path('register', register, name='register'),
    path('api/login/', api_login, name='api_login'),
    path('api/usuario-logado/', usuario_logado),
    path('', include(router.urls)),
]