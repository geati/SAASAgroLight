from django import forms

class LoginForms(forms.Form):
    username=forms.CharField(
        label='Login', 
        required=True, 
        max_length=100,
        widget=forms.TextInput(
            attrs={
                'class': 'form-group',
                'placeholder': 'Ex.: João Silva',
        }
    ))
    senha=forms.CharField(
        label='Senha', 
        required=True, 
        max_length=70,
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-group',
                'placeholder': 'Digite sua senha',
            }
        )
    )
    

class RegisterForms(forms.Form):
    username_cadastro=forms.CharField(
        label='Nome de usuário', 
        required=True, 
        max_length=100,
        widget=forms.TextInput(
            attrs={
                'class': 'form-group',
                'placeholder': 'Ex.: João Silva',
        }
    ))
    email=forms.EmailField(
        label='E-mail de cadastro',
        required=True,
        max_length=100,
        widget=forms.EmailInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Ex.: joaosilva@xpto.com',
            }
        )
    )
    senha_1=forms.CharField(
        label='Senha', 
        required=True, 
        max_length=70,
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Digite sua senha',
            }
        ),
    )
    senha_2=forms.CharField(
        label='Confirme sua senha', 
        required=True, 
        max_length=70,
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Digite sua senha novamente',
            }
        ),
    )

