import 'package:cloud_firestore/cloud_firestore.dart';

class Angre {
  Timestamp date;
  int effectif;
  int id;
  String nom;
  int participant;
  int taux;

  Angre({
    required this.date,
    required this.effectif,
    required this.id,
    required this.nom,
    required this.participant,
    required this.taux,
  });

  //Methode fromJson
  factory Angre.fromJson(Map<String, dynamic> json) {
    return Angre(
      date: json['date'] as Timestamp,
      effectif: json['effectif'] as int,
      id: json['id'] as int,
      nom: json['nom'] as String,
      participant: json['participant'] as int,
      taux: json['taux'] as int,
    );
  }

  //Methode pour convertir l'instance en Json
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'effectif': effectif,
      'id': id,
      'nom': nom,
      'participant': participant,
      'taux': taux,
    };
  }
}
