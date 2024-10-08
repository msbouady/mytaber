import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mytaber/models/sikensi.dart';
import 'package:mytaber/service/sikensi.dart';

class SikensiController extends GetxController {
  final SikensiService _service = SikensiService();

  // Stream pour expose aux vues pour ecouter les donnees
  Stream<List<Sikensi>> getSikensiStream(int id) =>
      _service.getSikensiStream(id: id);

// fonction add et remove
  Future<void> addParticipant(String id) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('Sikensi').doc(id.toString());
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
          FirebaseFirestore.instance.collection('Sikensi').doc(id.toString());
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
