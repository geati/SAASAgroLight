from django.db import models

# Modelo para campos de endereço (reutilizável)
class EnderecoBase(models.Model):
    logradouro = models.CharField(max_length=255, blank=True, null=True)
    numero = models.CharField(max_length=10, blank=True, null=True)
    complemento = models.CharField(max_length=255, blank=True, null=True)
    bairro = models.CharField(max_length=100, blank=True, null=True)
    cep = models.CharField(max_length=20, blank=True, null=True)
    cidade = models.CharField(max_length=100, blank=True, null=True)
    estado = models.CharField(max_length=2, blank=True, null=True)

    class Meta:
        abstract = True  # não cria tabela própria

class Cliente(EnderecoBase):
    idcliente = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=255, unique=True)
    email = models.EmailField(unique=True, blank=True, null=True)
    cpf_cnpj = models.CharField(max_length=14, unique=True, blank=True, null=True)
    telefone = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        db_table = 'clientes'  

    def __str__(self):
        return self.nome

class Fornecedor(EnderecoBase):
    idfornecedor = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=255)
    cpf_cnpj = models.CharField(max_length=14, unique=True, blank=True, null=True)
    email = models.EmailField(unique=True, blank=True, null=True)
    telefone = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        db_table = 'fornecedores' 

    def __str__(self):
        return self.nome

class Propriedade(EnderecoBase):
    idpropriedade = models.AutoField(primary_key=True)
    descricao = models.TextField(blank=True, null=True)
    telefone = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        db_table = 'propriedades'  

    def __str__(self):
        return self.descricao or f"Propriedade {self.idpropriedade}"

class PlanoDeContas(models.Model):
    idplanocontas   = models.AutoField(primary_key=True)
    descricao       = models.CharField(max_length=30, blank=True, null=True)
    tipofluxocaixa  = models.SmallIntegerField(blank=True, null=True)
    conta           = models.CharField(max_length=15, blank=True, null=True)

    class Meta:
        managed  = False
        db_table = 'plano_de_contas'

class ContaPagar(models.Model):
    id = models.AutoField(primary_key=True)
    descricao = models.CharField(max_length=100)
    valor_parcela = models.DecimalField(max_digits=10, decimal_places=2)
    parcelas = models.IntegerField()
    total = models.DecimalField(max_digits=12, decimal_places=2)
    vencimento = models.DateField()
    quitacao = models.DateField(blank=True, null=True)
    status = models.CharField(max_length=20, default='Ativa')
    juros = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    desconto = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    fornecedor = models.CharField(max_length=100)
    propriedade = models.CharField(max_length=100)
    plano_contas = models.CharField(max_length=100)


class ContaReceber(models.Model):
    id = models.AutoField(primary_key=True)
    descricao = models.CharField(max_length=100)
    valor_parcela = models.DecimalField(max_digits=10, decimal_places=2)
    parcelas = models.IntegerField()
    total = models.DecimalField(max_digits=12, decimal_places=2)
    vencimento = models.DateField()
    quitacao = models.DateField(blank=True, null=True)
    status = models.CharField(max_length=20, default='Ativa')
    juros = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    desconto = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    cliente = models.CharField(max_length=100)
    propriedade = models.CharField(max_length=100)
    plano_contas = models.CharField(max_length=100)