import 'package:cloud_firestore/cloud_firestore.dart';

class RecentFileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Méthode pour récupérer les données de plusieurs collections et filtrer les participants > 0
  Future<List<Map<String, dynamic>>> getRecentFiles() async {
    List<Future<QuerySnapshot>> futures = [
      _firestore
          .collection('Adiake')
          .where('participant', isGreaterThan: 0)
          .get(),
      _firestore
          .collection('Angre')
          .where('participant', isGreaterThan: 0)
          .get(),
      _firestore
          .collection('Bonoufla')
          .where('participant', isGreaterThan: 0)
          .get(),
      _firestore
          .collection('Gonzague')
          .where('participant', isGreaterThan: 0)
          .get(),
      _firestore
          .collection('Invite')
          .where('participant', isGreaterThan: 0)
          .get(),
      _firestore
          .collection('Portbouet')
          .where('participant', isGreaterThan: 0)
          .get(),
      _firestore
          .collection('Sikensi')
          .where('participant', isGreaterThan: 0)
          .get(),
      _firestore
          .collection('Yopougon')
          .where('participant', isGreaterThan: 0)
          .get(),
    ];

    List<QuerySnapshot> snapshots = await Future.wait(futures);
    List<Map<String, dynamic>> recentFiles = [];

    for (QuerySnapshot snapshot in snapshots) {
      for (DocumentSnapshot doc in snapshot.docs) {
        String name = doc.get('nom');
        Timestamp timestamp = doc.get('date');
        DateTime date = timestamp.toDate();
        int participant = doc.get('participant');

        if (participant > 0) {
          recentFiles.add({
            'icon': "assets/icons/Documents.svg",
            'title': name,
            'date':
                date.toString(), // Convertir la date en chaîne de caractères
            'size': participant.toString(),
          });
        }
      }
    }

    print('Recent files fetched: $recentFiles'); // Ajoutez ce log
    return recentFiles;
  }
}
