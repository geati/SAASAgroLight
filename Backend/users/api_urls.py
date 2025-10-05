from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UsuarioViewSet, solicitar_redefinicao, redefinir_senha

router = DefaultRouter()
router.register(r'usuarios', UsuarioViewSet, basename='usuario')

urlpatterns = [
    # rotas customizadas
    path('solicitar-redefinicao/', solicitar_redefinicao, name='solicitar_redefinicao'),
    path('redefinir-senha/<str:uidb64>/<str:token>/', redefinir_senha, name='redefinir_senha'),
    
    # rotas do router
    path('', include(router.urls)),
]