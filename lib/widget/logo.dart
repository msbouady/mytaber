import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;
  final double width;
  const Logo({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: width,
      height: height,
    );
  }
}
