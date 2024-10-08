import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytaber/models/ngre.dart';

const String collectionangre = 'Angre';

class AngreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Methode pour recuperer les donnees de firestore sous la forme

  Stream<List<Angre>> getAngreStream({required int id}) {
    return _firestore
        .collection(collectionangre)
        .where('id', isEqualTo: id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Angre.fromJson(doc.data());
      }).toList();
    });
  }
}
