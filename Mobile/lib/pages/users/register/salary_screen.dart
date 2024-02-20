// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:front/pages/home/home_screen.dart';
import 'package:front/services/salary_service.dart';
import 'package:page_transition/page_transition.dart';

class SalaryPage extends StatefulWidget {
  final String name;
  final String firstname;
  final String email;
  final String password;
  final int userId;

  const SalaryPage({
    super.key,
    required this.name,
    required this.firstname,
    required this.email,
    required this.password,
    required this.userId,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SalaryPageState createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _firstname;
  late String _email;
  late String _password;
  late int _userId;
  String _job = '';
  double _salary = 0.0;
  String _devise = 'Ariary';

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _firstname = widget.firstname;
    _email = widget.email;
    _password = widget.password;
    _userId = widget.userId;
  }

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
                height: 250,
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
                      'assets/Windows.png',
                      fit: BoxFit.cover,
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
                      "Comptes",
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
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Emplois'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrée votre emplois';
                          }
                          return null;
                        },
                        onSaved: (value) => _job = value!,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Salaires'),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrée votre salaires';
                          }
                          return null;
                        },
                        onSaved: (value) => _salary = double.parse(value!),
                      ),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Devise'),
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: 'MGA',
                            child: Text('MGA'),
                          ),
                          DropdownMenuItem(
                            value: 'Dollar',
                            child: Text('\$'),
                          ),
                          DropdownMenuItem(
                            value: 'Euro',
                            child: Text('€'),
                          ),
                          DropdownMenuItem(
                            value: 'Yen',
                            child: Text('¥'),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            _devise = newValue!;
                          });
                        },
                        onSaved: (value) => _devise = value!,
                      ),
                      Container(
                        height: 45,
                        margin: const EdgeInsets.only(
                          top: 20,
                          bottom: 50,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }

                            final serviceUserSalary = ServiceUserSalary();
                            serviceUserSalary.UserSalary(
                                _userId, _job, _salary, _devise);
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 400),
                                alignment: Alignment.bottomCenter,
                                child: const HomePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                          ),
                          child: const Center(
                            child: Text(
                              'Creer',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
