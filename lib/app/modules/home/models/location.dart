import 'info.dart';

class Locations {
  final Info info;
  final List<Location> results;

  Locations({
    required this.info,
    required this.results,
  });

  factory Locations.fromJson(Map<String, dynamic> json) {
    return Locations(
      info: Info.fromJson(json["info"]),
      results: List<Location>.from(json["results"].map((x) => Location.fromJson(x))),
    );
  }
}

class Location {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json["id"],
      name: json["name"],
      type: json["type"],
      dimension: json["dimension"],
      residents: List<String>.from(json["residents"].map((x) => x)),
      url: json["url"],
      created: DateTime.parse(json["created"]),
    );
  }
}
