from django.contrib import admin
from django.urls import path, include
from setup import settings
from django.conf.urls.static import static
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

urlpatterns = [
    path('admin/', admin.site.urls),
    
    # Rotas do app galeria (ex: páginas públicas)
    path('', include('galeria.urls')),

    # Rotas de páginas de usuários (ex: recuperação de senha, login page se tiver template)
    path('', include('users.urls')),

    # Rotas da API (JSON), como autenticação e redefinição de senha via API
    path('api/', include(('users.api_urls', 'users'), namespace='users_api')),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
