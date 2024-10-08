import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MultiCollectionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Méthode pour récupérer les données de plusieurs collections et calculer les totaux pour chaque ID
  Future<Map<int, Map<String, int>>> getTotalsFromMultipleCollections(
      List<int> ids) async {
    List<Future<QuerySnapshot>> futures = [
      _firestore.collection('Adiake').where('id', whereIn: ids).get(),
      _firestore.collection('Angre').where('id', whereIn: ids).get(),
      _firestore.collection('Bonoufla').where('id', whereIn: ids).get(),
      _firestore.collection('Gonzague').where('id', whereIn: ids).get(),
      _firestore.collection('Invite').where('id', whereIn: ids).get(),
      _firestore.collection('Portbouet').where('id', whereIn: ids).get(),
      _firestore.collection('Sikensi').where('id', whereIn: ids).get(),
      _firestore.collection('Yopougon').where('id', whereIn: ids).get(),
    ];

    List<QuerySnapshot> snapshots = await Future.wait(futures);
    Map<int, Map<String, int>> totals = {};

    for (int i = 0; i < snapshots.length; i++) {
      QuerySnapshot snapshot = snapshots[i];
      String collectionName = [
        'Adiake',
        'Angre',
        'Bonoufla',
        'Gonzague',
        'Invite',
        'Portbouet',
        'Sikensi',
        'Yopougon'
      ][i];
      debugPrint(
          'Collection: $collectionName, Documents: ${snapshot.docs.length}');

      for (DocumentSnapshot doc in snapshot.docs) {
        int id = doc.get('id');
        int participant = doc.get('participant');
        int effectif = doc.get('effectif');

        debugPrint(
            'Collection: $collectionName, Document ID: $id, Participant: $participant, Effectif: $effectif');

        if (!totals.containsKey(id)) {
          totals[id] = {'participant': 0, 'effectif': 0};
        }

        totals[id]!['participant'] = totals[id]!['participant']! + participant;
        totals[id]!['effectif'] = totals[id]!['effectif']! + effectif;
      }
    }

    debugPrint('Totals: $totals');
    return totals;
  }
}
