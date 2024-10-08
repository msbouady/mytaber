import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytaber/models/invite.dart';

const String collectioninvite = 'Invite';

class InviteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Methode pour recuperer les donnees de Firestore sous forme de stream
  Stream<List<Invite>> getInviteStream({required int id}) {
    return _firestore
        .collection(collectioninvite)
        .where('id', isEqualTo: id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Invite.fromJson(doc.data());
      }).toList();
    });
  }
}
