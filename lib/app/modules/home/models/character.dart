import 'info.dart';

class Characters {
  final Info info;
  final List<Character> results;

  Characters({
    required this.info,
    required this.results,
  });

  factory Characters.fromJson(Map<String, dynamic> json) {
    return Characters(
      info: Info.fromJson(json["info"]),
      results: List<Character>.from(json["results"].map((x) => Character.fromJson(x))),
    );
  }
}

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocation origin;
  final CharacterLocation location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
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
