from django.shortcuts import render, redirect
from users.forms import LoginForms, RegisterForms
from django.contrib.auth.hashers import make_password
from .models import Usuario

def login(request):
    form = LoginForms()
    
    if request.method == 'POST':
        form = LoginForms(request.POST)
        
        if form.is_valid():
            nome = form['username'].value()
            senha = form['senha'].value()
            
            try:
                user = Usuario.objects.get(nome=nome)
                
                if user.check_password(senha):  # Verificar senha usando hash
                    request.session['user_id'] = user.idusuario  # Criar sessão
                    return redirect('index')
                
            except Usuario.DoesNotExist:
                pass
        
        return redirect('login')

    return render(request, 'users/login.html', {"form": form})

def register(request):
    form = RegisterForms()
    
    if request.method == 'POST':
        form = RegisterForms(request.POST)
        
        if form.is_valid():
            if form["senha_1"].value() != form["senha_2"].value():
                return redirect ('register')
            
            nome=form['username_cadastro'].value()
            email=form['email'].value()
            senha=form['senha_1'].value()
            
            if Usuario.objects.filter(nome=nome).exists():
                return redirect('register')
            
            user = Usuario(
                nome=nome,
                email=email,
                senha=make_password(senha)  # Armazena senha com hash
            )
            user.save()
            
            return redirect('login')

    return render(request, 'users/register.html', {"form": form})