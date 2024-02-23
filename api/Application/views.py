from django.db.models import Sum, Count, Avg
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import action
from .utils import generate_jwt_token
from django.contrib.auth import logout
from django.db.models.functions import TruncMonth

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

    # Calculer le solde total pour tous les comptes
    @action(detail=False, methods=['get'])
    def total_balance(self, request):
        user_id = request.query_params.get('user_id')
        if user_id is None:
            return Response({"error": "user_id is required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user_id = int(user_id)
        except ValueError:
            return Response({"error": "user_id must be an integer"}, status=status.HTTP_400_BAD_REQUEST)

        total_balance = Accounts.objects.filter(user_id=user_id).aggregate(total=Sum('balance'))['total']
        return Response({'total_balance': total_balance})

    # Trouver le compte avec le solde le plus élevé
    @action(detail=False, methods=['get'])
    def highest_balance_account(self, request):
        user_id = request.query_params.get('user_id')
        if user_id is None:
            return Response({"error": "user_id is required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user_id = int(user_id)
        except ValueError:
            return Response({"error": "user_id must be an integer"}, status=status.HTTP_400_BAD_REQUEST)

        highest_balance_account = Accounts.objects.filter(user_id=user_id).order_by('-balance').first()
        if highest_balance_account is None:
            return Response({"message": "No account found for the given user."}, status=status.HTTP_204_NO_CONTENT)

        serializer = self.get_serializer(highest_balance_account)
        return Response(serializer.data)

    # Trouver le compte avec le solde le plus bas
    @action(detail=False, methods=['get'])
    def lowest_balance_account(self, request):
        user_id = request.query_params.get('user_id')
        if user_id is None:
            return Response({"error": "user_id is required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user_id = int(user_id)
        except ValueError:
            return Response({"error": "user_id must be an integer"}, status=status.HTTP_400_BAD_REQUEST)

        lowest_balance_account = Accounts.objects.filter(user_id=user_id).order_by('balance').first()
        if lowest_balance_account is None:
            return Response({"message": "No account found for the given user."}, status=status.HTTP_204_NO_CONTENT)

        serializer = self.get_serializer(lowest_balance_account)
        return Response(serializer.data)

    # Calculer le solde moyen de tous les comptes
    @action(detail=False, methods=['get'])
    def average_balance(self, request):
        user_id = request.query_params.get('user_id')
        if user_id is None:
            return Response({"error": "user_id is required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user_id = int(user_id)
        except ValueError:
            return Response({"error": "user_id must be an integer"}, status=status.HTTP_400_BAD_REQUEST)

        average_balance = Accounts.objects.filter(user_id=user_id).aggregate(average=Avg('balance'))['average']
        return Response({'average_balance': average_balance})


class CategoriesViewSet(viewsets.ModelViewSet):
    queryset = Categories.objects.all()
    serializer_class = CategoriesSerializer


class TransactionsViewSet(viewsets.ModelViewSet):
    queryset = Transactions.objects.all()
    serializer_class = TransactionsSerializer

    # Calcul le total des transactions par type (revenus, dépenses) pour un utilisateur donné.
    @action(detail=False, methods=['get'])
    def total_transactions(self, request):
        user_id = request.query_params.get('user_id')
        if user_id is None:
            return Response({"error": "user_id is required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user_id = int(user_id)
        except ValueError:
            return Response({"error": "user_id must be an integer"}, status=status.HTTP_400_BAD_REQUEST)

        # Calculer le total des revenus et des dépenses
        total_revenue = \
        Transactions.objects.filter(account__user_id=user_id, category__category_type='revenue').aggregate(
            total=Sum('amount'))['total']
        total_expense = \
        Transactions.objects.filter(account__user_id=user_id, category__category_type='expenses').aggregate(
            total=Sum('amount'))['total']

        return Response({'total_revenue': total_revenue, 'total_expense': total_expense})

    # Trouve la catégorie de transaction la plus courante pour un utilisateur donné.
    @action(detail=False, methods=['get'])
    def most_common_transaction(self, request):
        user_id = request.query_params.get('user_id')
        if user_id is None:
            return Response({"error": "user_id is required"}, status=status.HTTP_400_BAD_REQUEST)

        # Trouver la catégorie de transaction la plus courante pour l'utilisateur donné
        common_category = (Transactions.objects
                           .filter(account__user_id=user_id)
                           .values('category').annotate(count=Count('category'))
                           .order_by('-count').first())

        # Si aucune transaction n'est trouvée, renvoyer un message approprié
        if common_category is None:
            return Response({"message": "No transactions found for the given user."}, status=status.HTTP_204_NO_CONTENT)

        return Response(common_category)

    # Trouve les transactions les plus coûteuses pour un utilisateur donné.
    @action(detail=False, methods=['get'])
    def most_expensive_transactions(self, request):
        user_id = request.query_params.get('user_id')
        if user_id is None:
            return Response({"error": "user_id is required"}, status=status.HTTP_400_BAD_REQUEST)

        # Trouver les transactions les plus coûteuses pour l'utilisateur donné
        expensive_transactions = Transactions.objects.filter(account__user_id=user_id).order_by('-amount')[:5]
        # Assurez-vous que le sérialiseur TransactionsSerializer peut gérer correctement les requêtes d'agrégation
        serializer = self.get_serializer(expensive_transactions, many=True)
        return Response(serializer.data)

    # Identifie les périodes de l'année où les transactions sont les plus élevées pour un utilisateur donné.
    @action(detail=False, methods=['get'])
    def highest_transaction_period(self, request):
        user_id = request.query_params.get('user_id')
        if user_id is None:
            return Response({"error": "user_id is required"}, status=status.HTTP_400_BAD_REQUEST)

        # Filtrer les transactions par utilisateur via le modèle Accounts
        transactions_by_month = Transactions.objects.filter(account__user__id=user_id).annotate(
            month=TruncMonth('date')
        ).values('month').annotate(total=Sum('amount')).order_by('-total')

        # Retourner les  12 mois les plus élevés
        return Response(transactions_by_month[:12])

    @action(detail=False, methods=['get'])
    def top_gainers(self, request):
        user_id = request.query_params.get('user_id')
        if user_id is None:
            return Response({"error": "user_id is required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user_id = int(user_id)
        except ValueError:
            return Response({"error": "user_id must be an integer"}, status=status.HTTP_400_BAD_REQUEST)

        # Ajout de 'transaction_type' et 'category__category_name' dans les valeurs retournées
        top_gainers = Transactions.objects.filter(account__user_id=user_id, category__category_type='revenue').values(
            'transaction_type', 'category__category_name').annotate(total=Sum('amount')).order_by('-total')[:4]
        return Response(top_gainers)

    @action(detail=False, methods=['get'])
    def top_losers(self, request):
        user_id = request.query_params.get('user_id')
        if user_id is None:
            return Response({"error": "user_id is required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user_id = int(user_id)
        except ValueError:
            return Response({"error": "user_id must be an integer"}, status=status.HTTP_400_BAD_REQUEST)

        # Ajout de 'transaction_type' et 'category__category_name' dans les valeurs retournées
        top_losers = Transactions.objects.filter(account__user_id=user_id, category__category_type='expenses').values(
            'transaction_type', 'category__category_name').annotate(total=Sum('amount')).order_by('-total')[:4]
        return Response(top_losers)


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
