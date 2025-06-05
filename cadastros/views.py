from rest_framework import viewsets, permissions
from .models import Cliente
from .serializers import ClienteSerializer

class ClienteViewSet(viewsets.ModelViewSet):
    queryset = Cliente.objects.all().order_by('nome')
    serializer_class = ClienteSerializer
    
    # Apenas usuários autenticados podem criar/editar/deletar.
    permission_classes = [permissions.AllowAny]
