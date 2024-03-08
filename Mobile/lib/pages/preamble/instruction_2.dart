import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:front/pages/users/register/sign_up_screen.dart';
import 'package:page_transition/page_transition.dart';

class InformationsPage extends StatelessWidget {
  const InformationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 242),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 350,
                // color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 350,
                          height: 350,
                          child: Blob.fromID(
                            id: const ['16-6-4206'],
                            size: 350,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/Windows.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 30),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Faites-nous confiance.\n",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "À travers des graphiques clairs, des couleurs apaisantes et des fonctionnalités innovantes, votre portefeuille devient bien plus qu'un simple outil financier. \n",
                    ),
                    Text(
                      "Préparez-vous à explorer, à investir et à prospérer avec ce thème de portefeuille, car chaque interaction devient une opportunité de croissance.",
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 60,
                ),
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[800],
                ),
                child: TextButton(
                  child: const Text(
                    "Je Suis Prêt!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: const Duration(milliseconds: 400),
                        alignment: Alignment.bottomCenter,
                        child: const SignUpPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
