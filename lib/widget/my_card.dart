import 'package:flutter/material.dart';
import 'package:mytaber/utils/palette.dart';
import 'package:mytaber/widget/bouton.dart';
import 'package:mytaber/widget/texte.dart';

class MyCard extends StatelessWidget {
  final String titleLibelle;
  final Color bigContainerBorder;
  final Color headerColor;
  final int participantScore;
  final int effectifScore;
  final double tauxScore;
  final VoidCallback? add;
  final VoidCallback? remove;

  const MyCard({
    super.key,
    required this.titleLibelle,
    required this.bigContainerBorder,
    required this.headerColor,
    required this.participantScore,
    required this.effectifScore,
    required this.tauxScore,
    required this.add,
    required this.remove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(
            color: bigContainerBorder,
            width: 3.0,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(
              title: titleLibelle.toUpperCase(),
              color: headerColor,
            ),
            const SizedBox(height: 10),
            _buildButtonRow(
              // bouton add et remove
              add_: add,
              remove_: remove,
            ),
            const SizedBox(height: 10),
            _buildHeader(
              title: 'SCORE',
              color: headerColor.withOpacity(0.3),
            ),
            _buildScoreRow(
              color: headerColor.withOpacity(0.6),
              text1: 'PARTICIPANT',
              text2: 'EFFECTIF',
              text3: 'TAUX/EGLISE ',
              size: 20,
              colors: Colors.white,
            ),
            const SizedBox(height: 20),
            _buildScoreRow2(
              color: headerColor,
              text1: participantScore,
              text2: effectifScore,
              text3: tauxScore.toInt(),
              size: 50,
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour créer l'en-tête de la carte
  Widget _buildHeader({required String title, required Color color}) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Center(child: TextBlanc(text: title, size: 20)),
    );
  }

  // Méthode pour créer la rangée de boutons
  Widget _buildButtonRow({
    required VoidCallback? add_,
    required VoidCallback? remove_,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedButton(
            color: OtherColor.accentColor,
            onPressed: add_,
            padding: 10,
            paddingtext: 10,
            width: 300,
            height: 90,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_rounded,
                  size: 40,
                  color: Colors.black,
                ),
                TextNormal(
                  text: 'AJOUTER',
                  size: 30,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          RoundedButton(
            color: OtherColor.accentColor,
            onPressed: remove_,
            padding: 10,
            paddingtext: 10,
            width: 300,
            height: 90,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove,
                  size: 40,
                  color: OtherColor.textColor,
                ),
                TextNormal(
                  text: 'RETIRER',
                  size: 30,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Méthode pour créer une rangée de scores
  Widget _buildScoreRow({
    required Color color,
    required Color colors,
    required String text1,
    required String text2,
    required String text3,
    required double size,
  }) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextNormal(text: text1, size: size, color: colors),
            TextNormal(text: text2, size: size, color: colors),
            TextNormal(text: text3, size: size, color: colors),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreRow2({
    required Color color,
    required int text1,
    required int text2,
    required int text3,
    required double size,
  }) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextNormal(text: text1.toString(), size: size, color: color),
            TextNormal(text: text2.toString(), size: size, color: color),
            TextNormal(text: text3.toString(), size: size, color: color),
          ],
        ),
      ),
    );
  }
}
