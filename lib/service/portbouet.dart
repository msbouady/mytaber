import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytaber/models/portbouet.dart';

const String collectionportbouet = 'Portbouet';

class PortBouetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Méthode pour récupérer les données de Firestore sous forme de Stream
  Stream<List<PortBouet>> getPortBouetStream({required int id}) {
    return _firestore
        .collection(collectionportbouet)
        .where('id', isEqualTo: id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return PortBouet.fromJson(doc.data());
      }).toList();
    });
  }
}
