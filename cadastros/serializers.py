from rest_framework import serializers
from .models import Cliente

class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        # Aqui listamos todos os campos, em ordem limpa e explícita
        fields = '__all__'
        read_only_fields = ['idcliente']
