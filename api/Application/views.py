from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from .utils import generate_jwt_token
from django.contrib.auth import logout

from .models import Users, Accounts, Transactions, Salary, Expense, Revenu, Analytics, Categories
from rest_framework import viewsets, status
from .serializers import UsersSerializer, AccountsSerializer, TransactionsSerializer, SalarySerializer, \
    ExpenseSerializer, RevenuSerializer, AnalyticsSerializer, UserLoginSerializer, UserCreationSerializer, \
    CategoriesSerializer


class LoginView(APIView):
    serializer_class = UserLoginSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token = generate_jwt_token(user)
        return Response({"token": token})


def logout_view(request):
    logout(request)


class UsersViewSet(viewsets.ModelViewSet):
    queryset = Users.objects.all()
    serializer_class = UsersSerializer

    def create(self, request, *args, **kwargs):
        serializer = UserCreationSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        return Response(serializer.data, status=status.HTTP_201_CREATED)


class AccountsViewSet(viewsets.ModelViewSet):
    queryset = Accounts.objects.all()
    serializer_class = AccountsSerializer


class CategoriesViewSet(viewsets.ModelViewSet):
    queryset = Categories.objects.all()
    serializer_class = CategoriesSerializer


class TransactionsViewSet(viewsets.ModelViewSet):
    queryset = Transactions.objects.all()
    serializer_class = TransactionsSerializer


class AnalyticsViewSet(viewsets.ModelViewSet):
    queryset = Analytics.objects.all()
    serializer_class = AnalyticsSerializer


class SalaryViewSet(viewsets.ModelViewSet):
    queryset = Salary.objects.all()
    serializer_class = SalarySerializer


class ExpenseViewSet(viewsets.ModelViewSet):
    queryset = Expense.objects.all()
    serializer_class = ExpenseSerializer


class RevenuViewSet(viewsets.ModelViewSet):
    queryset = Revenu.objects.all()
    serializer_class = RevenuSerializer
