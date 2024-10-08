import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytaber/widget/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Timer(const Duration(seconds: 5), () {
      Get.offNamed(
        '/accueil',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OrientationBuilder(
          builder: (context, orientation) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;

            return Stack(
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: screenHeight * 0.4,
                      maxWidth: screenWidth * 0.4,
                    ),
                    child: Logo(
                      height: screenHeight * 0.4,
                      width: screenWidth * 0.4,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
