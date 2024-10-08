import 'package:cloud_firestore/cloud_firestore.dart';

class Bonoufla {
  Timestamp date;
  int effectif;
  int id;
  String nom;
  int participant;
  int taux;

  Bonoufla({
    required this.date,
    required this.effectif,
    required this.id,
    required this.nom,
    required this.participant,
    required this.taux,
  });

  // Methode fromJson
  factory Bonoufla.fromJson(Map<String, dynamic> json) {
    return Bonoufla(
      date: json['date'] as Timestamp,
      effectif: json['effectif'] as int,
      id: json['id'] as int,
      nom: json['nom'] as String,
      participant: json['participant'] as int,
      taux: json['taux'] as int,
    );
  }

  // Methode pour convertir l'insance en Json
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'effectif': effectif,
      'id': id,
      'nom': nom,
      'paricipant': participant,
      'taux': taux,
    };
  }
}
