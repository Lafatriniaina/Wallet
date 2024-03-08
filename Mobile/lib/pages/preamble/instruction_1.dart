import 'package:flutter/material.dart';
import 'package:blobs/blobs.dart';
import 'package:front/pages/preamble/instruction_2.dart';
import 'package:page_transition/page_transition.dart';

class Preamble extends StatelessWidget {
  const Preamble({super.key});

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
                        ClipRRect(
                          child: Image.asset(
                            'assets/Allura.png',
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
                      "Gérer vos comptes sur Pocket Wallet\n",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Bienvenue dans l'univers captivant de la gestion financière, où chaque transaction devient une étape dans votre voyage vers la prospérité. Dans ce royaume virtuel de chiffres et de transactions, votre portefeuille devient le reflet de vos choix, de vos objectifs et de vos aspirations. \n",
                    ),
                    Text(
                      "Explorez un design élégant qui transcende l'ordinaire, tout en bénéficiant d'une interface intuitive qui simplifie la navigation au sein de vos actifs et passifs.",
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
                    "Suivant",
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
                        child: const InformationsPage(),
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
