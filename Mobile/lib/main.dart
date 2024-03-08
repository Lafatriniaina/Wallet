import 'package:flutter/material.dart';
import 'package:front/models/user_provider.dart';
import 'package:front/pages/accounts/account.dart';
import 'package:front/pages/add_all_forms/all_form.dart';
import 'package:front/pages/categories/categories_screen.dart';
import 'package:front/pages/home/home_screen.dart';
import 'package:front/pages/preamble/instruction_1.dart';
import 'package:front/pages/statistics/statistics_screen.dart';
import 'package:front/pages/transactions/transactions_screen.dart';
import 'package:front/pages/users/login/sign_in_page.dart';
import 'package:front/pages/users/register/sign_up_screen.dart';
import 'package:front/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authService = AuthService();
  // await authService.deleteJWT();
  String token = await authService.getJWT();
  if (!await authService.isTokenValid(token)) {
    await authService.deleteJWT();
    token = '';
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider()..token = token,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    String? token = userProvider.token;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: token != null ? '/transactions' : '/preamble',
      routes: {
        '/preamble': (context) => const Preamble(),
        '/account': (context) => const DetailsAccount(),
        '/categories': (context) => const CategoriesPage(),
        '/': (context) => const HomePage(),
        '/user-register': (context) => const SignUpPage(),
        '/user-login': (context) => const SignInPage(),
        '/transactions': (context) => const TransactionsPage(),
        '/statistics': (context) => const StatisticsPage(),
        '/all-forms': (context) => const AllFormsPage(),
      },
    );
  }
}
