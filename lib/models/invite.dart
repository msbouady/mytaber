import 'package:cloud_firestore/cloud_firestore.dart';

class Invite {
  Timestamp date;
  int effectif;
  int id;
  String nom;
  int participant;
  int taux;

  Invite({
    required this.date,
    required this.effectif,
    required this.id,
    required this.nom,
    required this.participant,
    required this.taux,
  });

  //methode fromJson
  factory Invite.fromJson(Map<String, dynamic> json) {
    return Invite(
      date: json['date'] as Timestamp,
      effectif: json['effectif'] as int,
      id: json['id'] as int,
      nom: json['nom'] as String,
      participant: json['participant'] as int,
      taux: json['taux'] as int,
    );
  }
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
