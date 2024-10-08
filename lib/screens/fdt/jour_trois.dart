import 'package:flutter/material.dart';
import 'package:mytaber/screen/pagecomptes.dart';

class JourTrois extends StatelessWidget {
  final int njour;
  const JourTrois({
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
