import 'package:flutter/material.dart';
import 'package:front/pages/users/register/salary_screen.dart';
import 'package:front/services/user_service.dart';
import 'package:page_transition/page_transition.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _name = "", _firstname = "", _email = "", _password = "";

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
                      "Inscription",
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
                            const InputDecoration(labelText: 'Prénom(s)'),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Veuillez entre votre prénom';
                          }
                          return null;
                        },
                        onSaved: (value) => _firstname = value ?? "",
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
                            final serviceUserRegister = ServiceUserRegister();
                            // ignore: no_leading_underscores_for_local_identifiers
                            int? _userId =
                                await serviceUserRegister.UserRegiter(
                                    _name, _firstname, _email, _password);
                            if (_userId != null) {
                              Navigator.push(
                                // ignore: use_build_context_synchronously
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: const Duration(milliseconds: 400),
                                  alignment: Alignment.bottomCenter,
                                  child: SalaryPage(
                                    name: _name,
                                    firstname: _firstname,
                                    email: _email,
                                    password: _password,
                                    userId: _userId,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                          ),
                          child: const Center(
                            child: Text(
                              'Suivant',
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
                              "Avez-vous un compte?",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/user-login',
                                );
                              },
                              child: Text(
                                "S'indentifié",
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
