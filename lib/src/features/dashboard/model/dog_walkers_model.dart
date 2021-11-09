// To parse this JSON data, do
//
//     final dogWalkers = dogWalkersFromMap(jsonString);

import 'dart:convert';

DogWalkers dogWalkersFromMap(String str) =>
    DogWalkers.fromMap(json.decode(str));

String dogWalkersToMap(DogWalkers data) => json.encode(data.toMap());

class DogWalkers {
  DogWalkers({
    this.name,
    this.distance,
    this.starRating,
    this.chargeRate,
    this.noOfWalks,
    this.age,
    this.experience,
    this.about,
    this.imageString,
  });

  String? name;
  int? distance;
  double? starRating;
  int? chargeRate;
  int? noOfWalks;
  int? age;
  String? experience;
  String? about;
  String? imageString;

  DogWalkers copyWith({
    String? name,
    int? distance,
    double? starRating,
    int? chargeRate,
    int? noOfWalks,
    int? age,
    String? experience,
    String? about,
    String? imageString,
  }) =>
      DogWalkers(
        name: name ?? this.name,
        distance: distance ?? this.distance,
        starRating: starRating ?? this.starRating,
        chargeRate: chargeRate ?? this.chargeRate,
        noOfWalks: noOfWalks ?? this.noOfWalks,
        age: age ?? this.age,
        experience: experience ?? this.experience,
        about: about ?? this.about,
        imageString: imageString ?? this.imageString,
      );

  factory DogWalkers.fromMap(Map<String, dynamic> json) => DogWalkers(
      name: json["name"],
      distance: json["distance"],
      starRating: json["star_rating"].toDouble(),
      chargeRate: json["charge_rate"],
      noOfWalks: json["no_of_walks"],
      age: json["age"],
      experience: json["experience"],
      about: json["about"],
      imageString: json["image_string"]);

  Map<String, dynamic> toMap() => {
        "name": name,
        "distance": distance,
        "star_rating": starRating,
        "charge_rate": chargeRate,
        "no_of_walks": noOfWalks,
        "age": age,
        "experience": experience,
        "about": about,
        "image_string": imageString,
      };
}
