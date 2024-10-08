import 'package:get/get.dart';
import 'package:mytaber/screen/splashscreen.dart';
import 'package:mytaber/screens/fdt/jour_deux.dart';
import 'package:mytaber/screens/fdt/jour_quatre.dart';
import 'package:mytaber/screens/fdt/jour_trois.dart';
import 'package:mytaber/screens/fdt/jour_un.dart';
import 'package:mytaber/screens/main/main_screen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/accueil',
      page: () => const MainScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/jourun',
      page: () => const JourUn(
        njour: 1,
      ), //
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/jourdeux',
      page: () => const JourDeux(
        njour: 2,
      ), //
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/jourtrois',
      page: () => const JourTrois(
        njour: 3,
      ), //
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/jourquatre',
      page: () => const JourQuatre(
        njour: 4,
      ), //
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    /* GetPage(
      name: '/mycard',
      page: () => const MyCard(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),*/
  ];
}
