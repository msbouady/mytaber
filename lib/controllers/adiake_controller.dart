import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mytaber/models/adiake.dart';
import 'package:mytaber/service/adiake.dart';

class AdiakeController extends GetxController {
  final AdiakeService _service = AdiakeService();

  //stream expose au vues pour ecouter les donnees
  Stream<List<Adiake>> getAdiakeService(int id) =>
      _service.getAdiakeService(id: id);

  // fonction add et remove
  Future<void> addParticipant(String id) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('Adiake').doc(id.toString());
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
          FirebaseFirestore.instance.collection('Adiake').doc(id.toString());
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        int currentParticipant = doc.get('participant');
        if (currentParticipant > 0) {
          await docRef.update({'participant': currentParticipant - 1});
        }
      }
    } catch (e) {
      debugPrint('Error removing participant: $e');
    }
  }
}
