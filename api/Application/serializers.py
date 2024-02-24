from rest_framework import serializers
from .models import Users, Accounts, Categories, Transactions, Salary, Expense, Revenu, Analytics


class UserLoginSerializer(serializers.Serializer):
    name = serializers.CharField()
    email = serializers.EmailField()
    password = serializers.CharField(write_only=True)

    def validate(self, data):
        try:
            user = Users.objects.get(name=data["name"], email=data["email"])
        except Users.DoesNotExist:
            raise serializers.ValidationError("Invalid Credentials or user")

        if not user.check_password(data["password"]):
            raise serializers.ValidationError({"password: Invalid password"})

        data["user"] = user
        return data


class UserCreationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = Users
        fields = '__all__'

    def create(self, validated_data):
        user = Users.objects.create(**validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = '__all__'


class AccountsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Accounts
        fields = '__all__'


class CategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categories
        fields = '__all__'


class TransactionsSerializer(serializers.ModelSerializer):
    category = serializers.StringRelatedField(source='category.category_type')

    class Meta:
        model = Transactions
        fields = ['transaction_type', 'date', 'amount', 'account', 'category']


class SalarySerializer(serializers.ModelSerializer):
    class Meta:
        model = Salary
        fields = '__all__'


class ExpenseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Expense
        fields = '__all__'


class RevenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = Revenu
        fields = '__all__'


class AnalyticsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Analytics
        fields = '__all__'
