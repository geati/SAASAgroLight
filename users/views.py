from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from users.forms import LoginForms, RegisterForms
from django.contrib.auth import login as auth_login
from django.contrib.auth.hashers import make_password
from .models import Usuario
from django.http import JsonResponse
from rest_framework import viewsets
from .serializers import UsuarioSerializer
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.utils.http import urlsafe_base64_encode
from django.utils.http import urlsafe_base64_decode
from django.utils.encoding import force_bytes
from django.contrib.auth.tokens import default_token_generator
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from django.contrib.auth import get_user_model

#expõe o acesso aos dados via API
class UsuarioViewSet(viewsets.ModelViewSet):
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer

def login_view(request):  
    form = LoginForms()

    if request.method == 'POST':
        form = LoginForms(request.POST)

        if form.is_valid():
            username = form.cleaned_data['username']
            senha = form.cleaned_data['senha']

            user = authenticate(request, username=username, password=senha)

            if user is not None:
                auth_login(request, user)
                return redirect('index')

        return redirect('login_view')

    return render(request, 'users/login.html', {"form": form})

def register(request):
    form = RegisterForms()
    
    if request.method == 'POST':
        
        form = RegisterForms(request.POST)

        if form.is_valid():
            if form.cleaned_data["senha_1"] != form.cleaned_data["senha_2"]:
                return redirect('register')

            username = form.cleaned_data['username']
            email = form.cleaned_data['email']
            senha = form.cleaned_data['senha_1']

            if Usuario.objects.filter(username=username).exists():
                return redirect('register')

            user = Usuario(
                username=username,
                email=email
            )
            user.set_password(senha)
            user.save()

            return redirect('login_view')

    return render(request, 'users/register.html', {"form": form})



@csrf_exempt
def solicitar_redefinicao(request):
    if request.method == "POST":
        data = json.loads(request.body)
        email = data.get("email")

        try:
            user = Usuario.objects.get(email=email)
        except Usuario.DoesNotExist:
            return JsonResponse({'error': 'Usuário não encontrado.'}, status=404)

        token = default_token_generator.make_token(user)
        uid = urlsafe_base64_encode(force_bytes(user.pk))
        link = f"http://localhost:3000/redefinir-senha/{uid}/{token}/"

        # Envie o e-mail
        send_mail(
            'Redefinição de senha',
            f'Clique no link para redefinir sua senha: {link}',
            'seu_email@dominio.com',
            [email],
            fail_silently=False,
        )

        return JsonResponse({'message': 'E-mail enviado com instruções.'})
    
    
@csrf_exempt
def redefinir_senha(request, uidb64, token):
    print("\n\n================ CHAMOU O BACKEND DE REDEFINIÇÃO ================\n\n")

    
    if request.method == "POST":
        print("Requisição recebida para redefinição.")
        print("uidb64:", uidb64)
        print("token recebido:", token)        
        
        data = json.loads(request.body)
        nova_senha = data.get("senha")

        try:
            uid = urlsafe_base64_decode(uidb64).decode()
            print("UID decodificado:", uid)  # 👈 AQUI
            user = get_user_model().objects.get(pk=uid)
        except (TypeError, ValueError, OverflowError, User.DoesNotExist) as e:
            print("Erro ao decodificar UID ou buscar usuário:", e)
            return JsonResponse({'error': 'Usuário inválido.'}, status=400)

        if default_token_generator.check_token(user, token):
            print("Token válido.")
            user.set_password(nova_senha)
            user.save()
            return JsonResponse({'message': 'Senha redefinida com sucesso!'})
        else:
            print("Token inválido ou expirado.")
            return JsonResponse({'error': 'Token inválido ou expirado.'}, status=400)