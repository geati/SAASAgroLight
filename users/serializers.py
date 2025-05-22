# app/serializers.py
from rest_framework import serializers
from .models import Usuario

class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = [
            'id', 'username', 'email', 'first_name', 'last_name',
            'cpf', 'logradouro', 'numero', 'complemento', 'bairro',
            'cep', 'cidade', 'estado', 'tipousuario'
        ]