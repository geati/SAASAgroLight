from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    ClienteViewSet,
    FornecedorViewSet,
    PropriedadeViewSet,
    PlanoDeContasViewSet,
    ContaPagarViewSet,
    ContaReceberViewSet,
)

router = DefaultRouter()
router.register(r'clientes', ClienteViewSet, basename='cliente')
router.register(r'fornecedores', FornecedorViewSet, basename='fornecedor')
router.register(r'propriedades', PropriedadeViewSet, basename='propriedade')
router.register(r'plano-de-contas', PlanoDeContasViewSet, basename='plano-de-contas')
router.register(r'contas-pagar', ContaPagarViewSet, basename='conta-pagar')
router.register(r'contas-receber', ContaReceberViewSet, basename='conta-receber')

urlpatterns = [
    path('', include(router.urls)),
]