import 'dart:convert';

import 'info.dart';

AllCharacters charactersFromJson(String str) => AllCharacters.fromJson(json.decode(str));
List<Character> characterListFromJson(var body) => List<Character>.from(body.map((i) => Character.fromJson(i)));

class AllCharacters {
  final Info? info;
  final List<Character>? results;

  AllCharacters({
    this.info,
    this.results,
  });

  factory AllCharacters.fromJson(Map<String, dynamic> json) {
    return AllCharacters(
      info: Info.fromJson(json["info"]),
      results: List<Character>.from(json["results"].map((x) => Character.fromJson(x))),
    );
  }
}

class Character {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final CharacterLocation? origin;
  final CharacterLocation? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      origin: CharacterLocation.fromJson(json["origin"]),
      location: CharacterLocation.fromJson(json["location"]),
      image: json["image"],
      episode: List<String>.from(json["episode"].map((x) => x)),
      url: json["url"],
      created: DateTime.parse(json["created"]),
    );
  }
}

class CharacterLocation {
  String name;
  String url;

  CharacterLocation({
    required this.name,
    required this.url,
  });

  factory CharacterLocation.fromJson(Map<String, dynamic> json) {
    return CharacterLocation(
      name: json["name"],
      url: json["url"],
    );
  }
}
