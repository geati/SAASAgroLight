from rest_framework import viewsets, permissions
from .models import Cliente, Fornecedor, Propriedade
from .serializers import ClienteSerializer, FornecedorSerializer, PropriedadeSerializer

class ClienteViewSet(viewsets.ModelViewSet):
    queryset = Cliente.objects.all().order_by('nome')
    serializer_class = ClienteSerializer
    
    # Apenas usuários autenticados podem criar/editar/deletar.
    permission_classes = [permissions.AllowAny]
    
class FornecedorViewSet(viewsets.ModelViewSet):
    queryset = Fornecedor.objects.all().order_by('nome')
    serializer_class = FornecedorSerializer
    
    # Apenas usuários autenticados podem criar/editar/deletar.
    permission_classes = [permissions.AllowAny]

class PropriedadeViewSet(viewsets.ModelViewSet):
    queryset = Propriedade.objects.all().order_by('descricao')
    serializer_class = PropriedadeSerializer
    
    # Apenas usuários autenticados podem criar/editar/deletar.
    permission_classes = [permissions.AllowAny]

