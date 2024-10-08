import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytaber/controllers/adiake_controller.dart';
import 'package:mytaber/controllers/angre.dart';
import 'package:mytaber/controllers/bonoufla.dart';
import 'package:mytaber/controllers/gonzague.dart';
import 'package:mytaber/controllers/invite.dart';
import 'package:mytaber/controllers/portbouet_controller.dart';
import 'package:mytaber/controllers/sikensi.dart';
import 'package:mytaber/controllers/yopougon.dart';
import 'package:mytaber/models/adiake.dart';
import 'package:mytaber/models/bonoufla.dart';
import 'package:mytaber/models/gonzague.dart';
import 'package:mytaber/models/invite.dart';
import 'package:mytaber/models/ngre.dart';
import 'package:mytaber/models/portbouet.dart';
import 'package:mytaber/models/sikensi.dart';
import 'package:mytaber/models/yopougon.dart';
import 'package:mytaber/utils/palette.dart';
import 'package:mytaber/widget/my_card.dart';
import 'package:mytaber/widget/texte.dart';

class Pagecomptes extends StatelessWidget {
  final BonouflaController _bonouflaController = Get.put(BonouflaController());
  final GonzagueController _gonzagueController = Get.put(GonzagueController());
  final InviteController _inviteController = Get.put(InviteController());
  final AdiakeController _adiakeController = Get.put(AdiakeController());
  final YopougonController _yopougonController = Get.put(YopougonController());
  final AngreController _angreController = Get.put(AngreController());
  final SikensiController _sikensiController = Get.put(SikensiController());
  final PortBouetController _portBouetController =
      Get.put(PortBouetController());
  final int identifiant;
  Pagecomptes({
    super.key,
    required this.identifiant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextBlanc(text: 'Jour $identifiant', size: 14),
        leading: _buildBackButton(context),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildBonouflaSection(identifiant), // a modifier
              _buildGonzagueSection(identifiant),
              _buildInviteSection(identifiant),
              _buildAngreSection(identifiant),
              _buildPortBouetSection(identifiant),
              _buildSikensiSection(identifiant),
              _buildYopougonSection(identifiant),
              _buildAdiakeSection(identifiant),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_sharp,
        shadows: [
          Shadow(
            color: Colors.black87,
            offset: Offset(1.0, 1.0),
            blurRadius: 1.0,
          ),
        ],
      ),
    );
  }

  Widget _buildBonouflaSection(int id) {
    return StreamBuilder<List<Bonoufla>>(
      stream: _bonouflaController.getBonouflaStream(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          debugPrint('Erreur: ${snapshot.error}');
          return Center(child: Text('Erreur: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('aucune donnee'));
        }

        final bonouflas = snapshot.data!;
        return Column(
          children: bonouflas.map((bonoufla) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height *
                    0.5, // Hauteur minimale de 50% de la hauteur disponible
                maxHeight: MediaQuery.of(context)
                    .size
                    .height, // Hauteur maximale basée sur l'écran
                maxWidth:
                    800, // Vous pouvez ajuster la largeur maximale si nécessaire
              ),
              child: MyCard(
                titleLibelle: bonoufla.nom,
                bigContainerBorder: OtherColor.textColor.withOpacity(0.8),
                headerColor: OtherColor.textColor,
                participantScore: bonoufla.participant,
                effectifScore: bonoufla.effectif,
                tauxScore: bonoufla.taux.toDouble(),
                add: () {
                  _bonouflaController.addParticipant(id.toString());
                },
                remove: () {
                  _bonouflaController.removeParticipant(id.toString());
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildAngreSection(int id) {
    return StreamBuilder<List<Angre>>(
      stream: _angreController.getAngreStream(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          debugPrint('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final angres = snapshot.data!;
        return Column(
          children: angres.map((angre) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height *
                    0.5, // Hauteur minimale de 50% de la hauteur disponible
                maxHeight: MediaQuery.of(context)
                    .size
                    .height, // Hauteur maximale basée sur l'écran
                maxWidth:
                    800, // Vous pouvez ajuster la largeur maximale si nécessaire
              ),
              child: MyCard(
                titleLibelle: angre.nom,
                bigContainerBorder: OtherColor.textColor.withOpacity(0.8),
                headerColor: OtherColor.textColor,
                participantScore: angre.participant,
                effectifScore: angre.effectif,
                tauxScore: angre.taux.toDouble(),
                add: () {
                  _angreController.addParticipant(id.toString());
                }, //
                remove: () {
                  _angreController.removeParticipant(id.toString());
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildPortBouetSection(int id) {
    return StreamBuilder<List<PortBouet>>(
      stream: _portBouetController.getPortBouetStream(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          debugPrint('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final portBouets = snapshot.data!;
        return Column(
          children: portBouets.map((portBouet) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height *
                    0.5, // Hauteur minimale de 50% de la hauteur disponible
                maxHeight: MediaQuery.of(context)
                    .size
                    .height, // Hauteur maximale basée sur l'écran
                maxWidth:
                    800, // Vous pouvez ajuster la largeur maximale si nécessaire
              ),
              child: MyCard(
                titleLibelle: portBouet.nom,
                bigContainerBorder: OtherColor.marron,
                headerColor: OtherColor.marron,
                participantScore: portBouet.participant,
                effectifScore: portBouet.effectif,
                tauxScore: portBouet.taux.toDouble(),
                add: () {
                  _portBouetController.addParticipant(id.toString());
                },
                remove: () {
                  _portBouetController.removeParticipant(id.toString());
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildSikensiSection(int id) {
    return StreamBuilder<List<Sikensi>>(
      stream: _sikensiController.getSikensiStream(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          debugPrint('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final sikensis = snapshot.data!;
        return Column(
          children: sikensis.map((sikensi) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height *
                    0.5, // Hauteur minimale de 50% de la hauteur disponible
                maxHeight: MediaQuery.of(context)
                    .size
                    .height, // Hauteur maximale basée sur l'écran
                maxWidth:
                    800, // Vous pouvez ajuster la largeur maximale si nécessaire
              ),
              child: MyCard(
                titleLibelle: sikensi.nom,
                bigContainerBorder: OtherColor.vert,
                headerColor: OtherColor.vert,
                participantScore: sikensi.participant,
                effectifScore: sikensi.effectif,
                tauxScore: sikensi.taux.toDouble(),
                add: () {
                  _sikensiController.addParticipant(id.toString());
                },
                remove: () {
                  _sikensiController.removeParticipant(id.toString());
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildGonzagueSection(int id) {
    return StreamBuilder<List<Gonzague>>(
      stream: _gonzagueController.getGonzagueStream(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          debugPrint('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final gonzagues = snapshot.data!;
        return Column(
          children: gonzagues.map((gonzague) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height *
                    0.5, // Hauteur minimale de 50% de la hauteur disponible
                maxHeight: MediaQuery.of(context)
                    .size
                    .height, // Hauteur maximale basée sur l'écran
                maxWidth:
                    800, // Vous pouvez ajuster la largeur maximale si nécessaire
              ),
              child: MyCard(
                titleLibelle: gonzague.nom,
                bigContainerBorder: OtherColor.marron,
                headerColor: OtherColor.marron,
                participantScore: gonzague.participant,
                effectifScore: gonzague.effectif,
                tauxScore: gonzague.taux.toDouble(),
                add: () {
                  _gonzagueController.addParticipant(id.toString());
                },
                remove: () {
                  _gonzagueController.addParticipant(id.toString());
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildInviteSection(int id) {
    return StreamBuilder<List<Invite>>(
      stream: _inviteController.getInviteStream(id),
      builder: (BuildContext context, AsyncSnapshot<List<Invite>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          debugPrint('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final invites = snapshot.data!;
        return Column(
          children: invites.map((invite) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height *
                    0.5, // Hauteur minimale de 50% de la hauteur disponible
                maxHeight: MediaQuery.of(context)
                    .size
                    .height, // Hauteur maximale basée sur l'écran
                maxWidth:
                    800, // Vous pouvez ajuster la largeur maximale si nécessaire
              ),
              child: MyCard(
                titleLibelle: invite.nom,
                bigContainerBorder: OtherColor.vert,
                headerColor: OtherColor.vert,
                participantScore: invite.participant,
                effectifScore: invite.effectif,
                tauxScore: invite.taux.toDouble(),
                add: () {
                  _inviteController.addParticipant(id.toString());
                },
                remove: () {
                  _inviteController.removeParticipant(id.toString());
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildYopougonSection(int id) {
    return StreamBuilder<List<Yopougon>>(
      stream: _yopougonController.getYopougonStream(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          debugPrint('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final yopougons = snapshot.data!;
        return Column(
          children: yopougons.map((yopougon) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height *
                    0.5, // Hauteur minimale de 50% de la hauteur disponible
                maxHeight: MediaQuery.of(context)
                    .size
                    .height, // Hauteur maximale basée sur l'écran
                maxWidth:
                    800, // Vous pouvez ajuster la largeur maximale si nécessaire
              ),
              child: MyCard(
                titleLibelle: yopougon.nom,
                bigContainerBorder: OtherColor.textColor.withOpacity(0.8),
                headerColor: OtherColor.textColor,
                participantScore: yopougon.participant,
                effectifScore: yopougon.effectif,
                tauxScore: yopougon.taux.toDouble(),
                add: () {
                  _yopougonController.addParticipant(id.toString());
                },
                remove: () {
                  _yopougonController.removeParticipant(id.toString());
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildAdiakeSection(int id) {
    return StreamBuilder<List<Adiake>>(
      stream: _adiakeController.getAdiakeService(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          debugPrint('Error: ${snapshot.error}');
          return Center(
            child: Text('Erreur: ${snapshot.error}'),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Pas de donnees disponible'),
          );
        }
        final adiakes = snapshot.data!;
        return Column(
          children: adiakes.map((adiake) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.5,
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: 800,
              ),
              child: MyCard(
                titleLibelle: adiake.nom,
                bigContainerBorder: OtherColor.textColor.withOpacity(0.8),
                headerColor: OtherColor.textColor,
                participantScore: adiake.participant,
                effectifScore: adiake.effectif,
                tauxScore: adiake.taux.toDouble(),
                add: () {
                  _adiakeController.addParticipant(id.toString());
                },
                remove: () {
                  _adiakeController.removeParticipant(id.toString());
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
