import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importez GetX
import 'package:mytaber/controllers/menu_app_controller.dart';
import 'package:mytaber/responsive.dart';
import 'package:mytaber/screens/dashboard/dashboard_screen.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Get.find<MenuAppController>().scaffoldKey, // Utilisez Get.find
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
