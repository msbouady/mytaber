import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytaber/models/gonzague.dart';

const String collectionGonzague = 'Gonzague';

class GonzagueService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Methode pour recuperer les donnees de firestore sous forme de stream
  Stream<List<Gonzague>> getGonzagueStream({required int id}) {
    return _firestore
        .collection(collectionGonzague)
        .where('id', isEqualTo: id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Gonzague.fromJson(doc.data());
      }).toList();
    });
  }
}
