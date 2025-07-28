from rest_framework import viewsets, permissions
from .models import (
    Cliente,
    Fornecedor,
    Propriedade,
    PlanoDeContas,
    ContaPagar,
    ContaReceber
)
from .serializers import (
    ClienteSerializer,
    FornecedorSerializer,
    PropriedadeSerializer,
    PlanoDeContasSerializer,
    ContaPagarSerializer,
    ContaReceberSerializer,
)

class ClienteViewSet(viewsets.ModelViewSet):
    queryset = Cliente.objects.all().order_by('nome')
    serializer_class = ClienteSerializer
    permission_classes = [permissions.AllowAny]

class FornecedorViewSet(viewsets.ModelViewSet):
    queryset = Fornecedor.objects.all().order_by('nome')
    serializer_class = FornecedorSerializer
    permission_classes = [permissions.AllowAny]

class PropriedadeViewSet(viewsets.ModelViewSet):
    queryset = Propriedade.objects.all().order_by('descricao')
    serializer_class = PropriedadeSerializer
    permission_classes = [permissions.AllowAny]

class PlanoDeContasViewSet(viewsets.ModelViewSet):
    queryset = PlanoDeContas.objects.all()
    serializer_class = PlanoDeContasSerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        modelo = self.request.query_params.get('modelo')
        if modelo and modelo.isdigit():
            return self.queryset.filter(tipofluxocaixa=int(modelo)).order_by('conta')
        return self.queryset.order_by('conta')

class ContaPagarViewSet(viewsets.ModelViewSet):
    queryset = ContaPagar.objects.all()
    serializer_class = ContaPagarSerializer
    permission_classes = [permissions.AllowAny]

class ContaReceberViewSet(viewsets.ModelViewSet):
    queryset = ContaReceber.objects.all()
    serializer_class = ContaReceberSerializer
    permission_classes = [permissions.AllowAny]
