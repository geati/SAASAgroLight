from django.db import models
from django.contrib.auth.hashers import check_password, make_password


class Usuario(models.Model):
    idusuario = models.AutoField(primary_key=True)  # SERIAL equivale a AutoField
    nome = models.CharField(max_length=50, unique=True)  # d_nome → VARCHAR(50)
    email = models.EmailField(max_length=50, unique=True, null=True, blank=True)  # d_email → VARCHAR(50)
    cpf = models.CharField(max_length=14, unique=True, null=True, blank=True)  # d_cpf_cnpj → VARCHAR(14)
    logradouro = models.CharField(max_length=50, null=True, blank=True)  # d_logradouro → VARCHAR(50)
    numero = models.IntegerField(null=True, blank=True)  # d_numero → INTEGER
    complemento = models.CharField(max_length=50, null=True, blank=True)  # d_complemento → VARCHAR(50)
    bairro = models.CharField(max_length=30, null=True, blank=True)  # d_bairro → VARCHAR(30)
    cep = models.CharField(max_length=8, null=True, blank=True)  # d_cep → VARCHAR(8)
    cidade = models.CharField(max_length=30, null=True, blank=True)  # d_cidade → VARCHAR(30)
    estado = models.CharField(max_length=2, null=True, blank=True)  # d_estado → CHAR(2)
    tipousuario = models.SmallIntegerField(null=True, blank=True)  # SMALLINT
    senha = models.CharField(max_length=128)  # Campo para armazenar senha criptografada

    class Meta:
        db_table = "usuarios"  # Nome exato da tabela no banco
        managed = False  # Django não gerencia essa tabela
        
    def set_password(self, raw_password):
        self.senha = make_password(raw_password)

    def check_password(self, raw_password):
        return check_password(raw_password, self.senha)

    def __str__(self):
        return f"{self.nome} - {self.email}"
