import 'package:flutter/material.dart';
import 'package:mytaber/screen/pagecomptes.dart';

class JourUn extends StatelessWidget {
  final int njour;
  const JourUn({super.key, required this.njour});

  @override
  Widget build(BuildContext context) {
    return Pagecomptes(
      identifiant: njour,
    );
  }
}
