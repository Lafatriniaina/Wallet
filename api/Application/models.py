from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import User
from django.db import models
from django.conf import settings


class CustomUserManager(BaseUserManager):
    def create_user(self, name, firstname, email, password=None):
        if not email:
            raise ValueError('The Email field must be set')
        email = self.normalize_email(email)
        user = self.model(name=name, firstname=firstname, email=email)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, name, firstname, email, password):
        user = self.create_user(name, firstname, email, password)
        user.is_admin = True
        user.save(self._db)
        return user


class Users(AbstractBaseUser):
    name = models.CharField(max_length=255)
    firstname = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=255)
    is_admin = models.BooleanField(default=False, blank=True)

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name', 'firstname']

    def __str__(self):
        return self.email

    @staticmethod
    def has_perm(perm, obj=None):
        return True

    @staticmethod
    def has_module_perms(app_label):
        return True

    @property
    def is_staff(self):
        return self.is_admin


class Accounts(models.Model):
    ACCOUNT_TYPE = [
        ('cash', 'Espèce'),
        ('check', 'Chèque'),
    ]
    user = models.ForeignKey(Users, on_delete=models.CASCADE, null=True)
    account_name = models.CharField(max_length=100)
    account_type = models.CharField(max_length=14, choices=ACCOUNT_TYPE)
    balance = models.DecimalField(max_digits=14, decimal_places=2)


class Categories(models.Model):
    CATEGORIES_TYPES = [
        ('revenue', 'revenus'),
        ('expenses', 'depenses')
    ]
    category_name = models.CharField(max_length=100)
    category_type = models.CharField(max_length=10, choices=CATEGORIES_TYPES)
    icon_name = models.CharField(max_length=100, blank=True)

    def __str__(self):
        return self.category_name


class Transactions(models.Model):
    account = models.ForeignKey(Accounts, on_delete=models.CASCADE, null=True)
    transaction_type = models.CharField(max_length=50)
    amount = models.DecimalField(max_digits=14, decimal_places=2)
    date = models.DateField()
    category = models.ForeignKey(Categories, on_delete=models.SET_NULL, null=True)


class Analytics(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE, null=True)
    account = models.ForeignKey(Accounts, on_delete=models.CASCADE, null=True)
    transaction = models.ForeignKey(Transactions, on_delete=models.CASCADE, null=True)
    category = models.ForeignKey(Categories, on_delete=models.CASCADE, null=True)
    date = models.DateField()
    amount = models.DecimalField(max_digits=14, decimal_places=2)
    transaction_type = models.CharField(max_length=50)


class Salary(models.Model):
    DEVICE_TYPES = [
        ('Ariary', 'MGA'),
        ('Dollar', '$'),
        ('Euro', '€'),
        ('Yen', '¥')
    ]
    user = models.OneToOneField(Users, on_delete=models.CASCADE, null=True)
    job = models.CharField(max_length=100, default="")
    salary = models.DecimalField(max_digits=14, decimal_places=2)
    devise = models.CharField(max_length=50, choices=DEVICE_TYPES, default='MGA')


class Expense(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE, null=True)
    category = models.ForeignKey(Categories, limit_choices_to={'category_type': 'expenses'}, on_delete=models.SET_NULL,
                                 null=True)
    amount = models.DecimalField(max_digits=14, decimal_places=2)
    date = models.DateField()


class Revenu(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE, null=True)
    category = models.ForeignKey(Categories, limit_choices_to={'category_type': 'revenus'}, on_delete=models.SET_NULL,
                                 null=True)
    amount = models.DecimalField(max_digits=14, decimal_places=2)
    date = models.DateField()


# class Investments(models.Model):
#     user = models.ForeignKey(Users, on_delete=models.CASCADE)
#     stock_symbol = models.CharField(max_length=100)
#     purchase_price = models.DecimalField(max_digits=14, decimal_places=2)
#     quantity = models.IntegerField()
#     purchase_date = models.DateField()
#
#
# class Budget(models.Model):
#     user = models.ForeignKey(Users, on_delete=models.CASCADE)
#     budget_amount = models.DecimalField(max_digits=14, decimal_places=2)
#     start_date = models.DateField()
#     end_date = models.DateField()
#
#
# class Savings(models.Model):
#     user = models.ForeignKey(Users, on_delete=models.CASCADE)
#     saving_goal = models.DecimalField(max_digits=14, decimal_places=2)
#     current_balance = models.DecimalField(max_digits=14, decimal_places=2)
#     start_date = models.DateField()
#     end_date = models.DateField()
#
#
# class Loan(models.Model):
#     user = models.ForeignKey(Users, on_delete=models.CASCADE)
#     loan_amount = models.DecimalField(max_digits=14, decimal_places=2)
#     interest_rate = models.DecimalField(max_digits=5, decimal_places=2)
#     due_date = models.DateField()
#
#
# class Debts(models.Model):
#     user = models.ForeignKey(Users, on_delete=models.CASCADE)
#     debt_amount = models.DecimalField(max_digits=14, decimal_places=2)
#     creditor = models.CharField(max_length=100)
#     due_date = models.DateField()
