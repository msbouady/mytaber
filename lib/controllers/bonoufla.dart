import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytaber/models/bonoufla.dart';
import 'package:mytaber/service/bonoufla.dart';

class BonouflaController extends GetxController {
  final BonouflaService _service = BonouflaService();

  // Stream pour écouter les données à la vue
  Stream<List<Bonoufla>> getBonouflaStream(int id) =>
      _service.getBonouflaStream(id: id);
  Future<void> addParticipant(String id) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('Bonoufla').doc(id.toString());
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        int currentParticipant = doc.get('participant');
        await docRef.update({'participant': currentParticipant + 1});
        debugPrint(
            'Participant added successfully. New count: ${currentParticipant + 1}');
      } else {
        debugPrint('Document does not exist for id: $id');
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
        int currentParticipant = doc.get('participant');
        if (currentParticipant > 0) {
          await docRef.update({'participant': currentParticipant - 1});
          debugPrint(
              'Participant removed successfully. New count: ${currentParticipant - 1}');
        } else {
          debugPrint('Participant count is already 0 for id: $id');
        }
      } else {
        debugPrint('Document does not exist for id: $id');
      }
    } catch (e) {
      debugPrint('Error removing participant: $e');
    }
  }
}
