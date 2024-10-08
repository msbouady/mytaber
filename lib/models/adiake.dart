import 'package:cloud_firestore/cloud_firestore.dart';

class Adiake {
  Timestamp date;
  int effectif;
  int id;
  String nom;
  int participant;
  int taux;

  Adiake({
    required this.date,
    required this.effectif,
    required this.id,
    required this.nom,
    required this.participant,
    required this.taux,
  });

  //Methode fromJson
  factory Adiake.fromJson(Map<String, dynamic> json) {
    return Adiake(
        date: json['date'] as Timestamp,
        effectif: json['effectif'] as int,
        id: json['id'] as int,
        nom: json['nom'] as String,
        participant: json['participant'] as int,
        taux: json['taux'] as int);
  }

  // Methode pour convertir l'instance en json

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
