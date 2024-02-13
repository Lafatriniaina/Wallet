from django.contrib import admin
from django.urls import path, include
from Application.views import UsersViewSet, AccountsViewSet, TransactionsViewSet, SalaryViewSet, ExpenseViewSet, \
    RevenuViewSet, AnalyticsViewSet, LoginView, logout_view, CategoriesViewSet
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'users', UsersViewSet)
router.register(r'accounts', AccountsViewSet)
router.register(r'transactions', TransactionsViewSet)
router.register(r'salary', SalaryViewSet)
router.register(r'expense', ExpenseViewSet)
router.register(r'revenu', RevenuViewSet)
router.register(r'analytics', AnalyticsViewSet)
router.register(r'categories', CategoriesViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', logout_view, name="logout"),
    path('', include(router.urls)),
]
