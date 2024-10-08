import 'package:flutter/material.dart';
import 'package:mytaber/screen/pagecomptes.dart';

class JourDeux extends StatelessWidget {
  final int njour;
  const JourDeux({
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
