import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytaber/utils/palette.dart';
import 'package:mytaber/widget/bouton.dart';
import 'package:mytaber/widget/texte.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image comme titre
                const SizedBox(height: 20),
                Image.asset(
                  'img/titre.jpg',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const TextGras(text: 'Fetes des tabernacles', size: 40),
                const TextGras(text: 'Edition 2024', size: 14),
                const SizedBox(height: 20),
                // Premier bouton
                RoundedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Get.toNamed('/pagecomptes');
                  },
                  padding: 12,
                  paddingtext: 12,
                  width: 900,
                  height: 100,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBlanc(text: 'JOUR 1', size: 40),
                      Icon(
                        Icons.arrow_forward,
                        size: 60,
                        color: OtherColor.accentColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Deuxième bouton
                RoundedButton(
                  color: Colors.red,
                  onPressed: () {},
                  padding: 12,
                  paddingtext: 12,
                  width: 900,
                  height: 100,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBlanc(text: 'JOUR 2', size: 40),
                      Icon(
                        Icons.arrow_forward,
                        size: 60,
                        color: OtherColor.accentColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Troisième bouton
                RoundedButton(
                  color: Colors.yellow,
                  onPressed: () {},
                  padding: 12,
                  paddingtext: 12,
                  width: 900,
                  height: 100,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBlanc(text: 'JOUR 3', size: 40),
                      Icon(
                        Icons.arrow_forward,
                        size: 60,
                        color: OtherColor.accentColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Quatrième bouton
                RoundedButton(
                  color: Colors.green,
                  onPressed: () {},
                  padding: 12,
                  paddingtext: 12,
                  width: 900,
                  height: 100,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBlanc(text: 'JOUR 4', size: 40),
                      Icon(
                        Icons.arrow_forward,
                        size: 60,
                        color: OtherColor.accentColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                RoundedButton(
                  color: Colors.orange,
                  onPressed: () {},
                  padding: 12,
                  paddingtext: 12,
                  width: 900,
                  height: 100,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBlanc(text: 'RECAPITULATIF ', size: 40),
                      Icon(
                        Icons.arrow_forward,
                        size: 60,
                        color: OtherColor.accentColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
