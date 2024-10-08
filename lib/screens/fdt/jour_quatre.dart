import 'package:flutter/material.dart';
import 'package:mytaber/screen/pagecomptes.dart';

class JourQuatre extends StatelessWidget {
  final int njour;
  const JourQuatre({
    super.key,
    required this.njour,
  });

  @override
  Widget build(BuildContext context) {
    return Pagecomptes(
      identifiant: njour,
    );
  }
}
