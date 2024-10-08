import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mytaber/models/gonzague.dart';
import 'package:mytaber/service/gonzague.dart';

class GonzagueController extends GetxController {
  final GonzagueService _service = GonzagueService();

  //Stream expose aux vues pour ecouter les donnees
  Stream<List<Gonzague>> getGonzagueStream(int id) =>
      _service.getGonzagueStream(id: id);

// fonction add et remove
  Future<void> addParticipant(String id) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('Gonzague').doc(id.toString());
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        int currentParticipant = doc.get('participant');
        await docRef.update({'participant': currentParticipant + 1});
      }
    } catch (e) {
      debugPrint('Error adding participant: $e');
    }
  }

  Future<void> removeParticipant(String id) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('Bonoufla').doc(id.toString());
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        int currentParticipant = doc.get('Gonzague');
        if (currentParticipant > 0) {
          await docRef.update({'participant': currentParticipant - 1});
        }
      }
    } catch (e) {
      debugPrint('Error removing participant: $e');
    }
  }
}
