import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytaber/models/bonoufla.dart';

const String collectionbonoufla = 'Bonoufla';

class BonouflaService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Méthode pour récupérer les données de Firestore sous forme de stream
  Stream<List<Bonoufla>> getBonouflaStream({required int id}) {
    return _firestore
        .collection(collectionbonoufla)
        .where('id', isEqualTo: id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Bonoufla.fromJson(doc.data());
      }).toList();
    });
  }
}
