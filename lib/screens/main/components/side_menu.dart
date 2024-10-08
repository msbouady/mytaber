import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Tableau de bord",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Jeudi",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              Get.toNamed('/jourun');
            },
          ),
          DrawerListTile(
            title: "Vendredi",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              Get.toNamed('jourdeux');
            },
          ),
          DrawerListTile(
            title: "Samedi",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Get.toNamed('jourtrois');
            },
          ),
          DrawerListTile(
            title: "Dimanche",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Get.toNamed('jourquatre');
            },
          ),
          DrawerListTile(
            title: "Assistance",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
