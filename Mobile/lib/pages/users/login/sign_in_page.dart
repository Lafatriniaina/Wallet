// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:front/models/user_provider.dart';
import 'package:front/services/auth_service.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "", _email = "", _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 242),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 240,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Image.asset(
                      'assets/logo.png',
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: Text(
                        "App Name",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: const Text(
                      "Identification",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Nom(s)'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entre votre nom';
                          }
                          return null;
                        },
                        onSaved: (value) => _name = value ?? "",
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Adresse e-mail'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entre votre email';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value ?? "",
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Mot de passe'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entre votre password';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value ?? "",
                      ),
                      Container(
                        height: 45,
                        margin: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                            final authService = AuthService();
                            Map<String, dynamic> success = await authService
                                .login(_name, _email, _password);
                            if (success.isNotEmpty) {
                              String token = success['token'];
                              Provider.of<UserProvider>(context, listen: false)
                                  .token = token;
                              authService.storeJWT(token);
                              Navigator.pushReplacementNamed(
                                context,
                                '/transactions',
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                          ),
                          child: const Center(
                            child: Text(
                              'Se connecter',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          bottom: 40,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Vous n'avez pas de compte?",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/user-register',
                                );
                              },
                              child: Text(
                                "S'inscrire",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.amber[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // ... (Votre bouton "Créer un compte" ici)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
