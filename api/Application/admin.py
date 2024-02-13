from django.contrib import admin

from Application.models import Users, Salary, Transactions, Accounts, Categories, Analytics, Expense, Revenu


@admin.register(Users, Salary, Transactions, Accounts, Categories, Analytics, Expense, Revenu)
class GenerateAdmin(admin.ModelAdmin):
    pass
