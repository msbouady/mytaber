import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getBonouflaData() async {
    final snapshot = await _firestore.collection('Bonoufla').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getAngreData() async {
    final snapshot = await _firestore.collection('Angre').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getYopougonData() async {
    final snapshot = await _firestore.collection('Yopougon').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getSikensiData() async {
    final snapshot = await _firestore.collection('Sikensi').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getAdiakeData() async {
    final snapshot = await _firestore.collection('Adiake').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getGonzagueData() async {
    final snapshot = await _firestore.collection('Gonzague').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getInviteData() async {
    final snapshot = await _firestore.collection('Invite').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getPortBouetData() async {
    final snapshot = await _firestore.collection('Portbouet').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
