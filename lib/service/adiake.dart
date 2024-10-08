import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytaber/models/adiake.dart';

const String collectionadiake = 'Adiake';

class AdiakeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Methode get pour recuperer les donnees de Firestore sous forme de stream

  Stream<List<Adiake>> getAdiakeService({required int id}) {
    return _firestore
        .collection(collectionadiake)
        .where('id', isEqualTo: id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Adiake.fromJson(doc.data());
      }).toList();
    });
  }
}
