from django.contrib import admin
from galeria.models import Exemplo

class ListaExemplos(admin.ModelAdmin):
    list_display = ("id", "nome",)
    
# Registro do BD no admin
admin.site.register(Exemplo, ListaExemplos)