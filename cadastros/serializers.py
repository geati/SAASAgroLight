from rest_framework import serializers
from .models import Cliente, Fornecedor, Propriedade

class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        # Aqui listamos todos os campos, em ordem limpa e explícita
        fields = '__all__'
        read_only_fields = ['idcliente']
        
class FornecedorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Fornecedor
        fields = '__all__'
        read_only_fields = ['idfornecedor']

class PropriedadeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Propriedade
        fields = '__all__'
        read_only_fields = ['idpropriedade']
