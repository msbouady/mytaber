import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytaber/models/sikensi.dart';

const String collectionsikensi = 'Sikensi';

class SikensiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Methode pour recuperer les donnees de Firestore sous forme de Stream
  Stream<List<Sikensi>> getSikensiStream({required int id}) {
    return _firestore
        .collection(collectionsikensi)
        .where('id', isEqualTo: id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Sikensi.fromJson(doc.data());
      }).toList();
    });
  }
}
