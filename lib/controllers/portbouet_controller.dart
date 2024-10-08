import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mytaber/models/portbouet.dart';
import 'package:mytaber/service/portbouet.dart';

class PortBouetController extends GetxController {
  final PortBouetService _service = PortBouetService();

  // Stream exposé aux vues pour écouter les données
  Stream<List<PortBouet>> getPortBouetStream(int id) =>
      _service.getPortBouetStream(id: id);
  // fonction add et remove
  Future<void> addParticipant(String id) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('Portbouet').doc(id.toString());
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
          FirebaseFirestore.instance.collection('Portbouet').doc(id.toString());
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
