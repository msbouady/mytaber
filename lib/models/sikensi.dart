import 'package:cloud_firestore/cloud_firestore.dart';

class Sikensi {
  Timestamp date;
  int effectif;
  int id;
  String nom;
  int participant;
  int taux;

  Sikensi({
    required this.date,
    required this.effectif,
    required this.id,
    required this.nom,
    required this.participant,
    required this.taux,
  });

  //methode fromJson
  factory Sikensi.fromJson(Map<String, dynamic> json) {
    return Sikensi(
      date: json['date'] as Timestamp,
      effectif: json['effectif'] as int,
      id: json['id'] as int,
      nom: json['nom'] as String,
      participant: json['participant'] as int,
      taux: json['taux'] as int,
    );
  }

  //methode pour convertir l'instance en json

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
