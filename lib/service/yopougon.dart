import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytaber/models/yopougon.dart';

const String collectionyopougon = 'Yopougon';

class YopougonService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Methode pour recuperer les donnees de Firestore sous forme de stream

  Stream<List<Yopougon>> getYopougonStream({required int id}) {
    return _firestore
        .collection(collectionyopougon)
        .where('id', isEqualTo: id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Yopougon.fromJson(doc.data());
      }).toList();
    });
  }
}
