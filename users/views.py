from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from users.forms import LoginForms, RegisterForms
from django.contrib.auth import login as auth_login
from django.contrib.auth.hashers import make_password
from .models import Usuario


def login_view(request):  # Altere para login_view para evitar o conflito com o login do Django
    form = LoginForms()

    if request.method == 'POST':
        form = LoginForms(request.POST)

        if form.is_valid():
            username = form.cleaned_data['username']
            senha = form.cleaned_data['senha']

            user = authenticate(request, username=username, password=senha)

            if user is not None:
                auth_login(request, user)  # Correto uso da função auth_login do Django
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
            user.set_password(senha)  # Usa o hash correto do Django
            user.save()

            return redirect('login_view')

    return render(request, 'users/register.html', {"form": form})