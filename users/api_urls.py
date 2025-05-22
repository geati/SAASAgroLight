from django.urls import path
from .views import solicitar_redefinicao, redefinir_senha

urlpatterns = [
    path('solicitar-redefinicao/', solicitar_redefinicao, name='solicitar_redefinicao'),
    path('redefinir-senha/<uidb64>/<token>/', redefinir_senha, name='redefinir_senha'),
]
