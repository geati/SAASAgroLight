from rest_framework import serializers
from .models import Usuario


class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = [
            'id', 'username', 'first_name', 'last_name', 'email',
            'cpf', 'telefone', 'logradouro', 'numero', 'complemento', 'bairro',
            'cidade', 'estado', 'cep', 'tipousuario', 'password', 'is_active'
        ]
        extra_kwargs = {
            'password': {'write_only': True, 'required': False},  # para não mostrar senha na resposta
            'username' : {'required': False}
        }
        
    def create(self, validated_data):
        password = validated_data.pop('password', None)
        user = Usuario(**validated_data)
        if password:
            user.set_password(password)
        else:
            user.set_unusable_password()
        user.save()
        return user

    def update(self, instance, validated_data):
        password = validated_data.pop('password', None)  
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        if password:
            instance.set_password(password)
        instance.save()
        return instance
