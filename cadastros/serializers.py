from rest_framework import serializers
from .models import (
    Cliente,
    Fornecedor,
    Propriedade,
    PlanoDeContas,
    ContaPagar,
    ContaReceber
)

class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
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

class PlanoDeContasSerializer(serializers.ModelSerializer):
    class Meta:
        model = PlanoDeContas
        fields = ['idplanocontas', 'descricao', 'tipofluxocaixa', 'conta']
        read_only_fields = ['idplanocontas']

class ContaPagarSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContaPagar
        fields = [
            'id',
            'descricao',
            'valor_parcela',
            'parcelas',
            'total',
            'vencimento',
            'quitacao',
            'status',
            'juros',
            'desconto',
            'fornecedor',
            'propriedade',
            'plano_contas'
        ]
        read_only_fields = ['id']

class ContaReceberSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContaReceber
        fields = [
            'id',
            'descricao',
            'valor_parcela',
            'parcelas',
            'total',
            'vencimento',
            'quitacao',
            'status',
            'juros',
            'desconto',
            'cliente',
            'propriedade',
            'plano_contas'
        ]
        read_only_fields = ['id']

