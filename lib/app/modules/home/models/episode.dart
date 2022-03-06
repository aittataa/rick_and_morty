import 'dart:convert';

import 'info.dart';

AllEpisodes episodesFromJson(String str) => AllEpisodes.fromJson(json.decode(str));
List<Episode> episodeListFromJson(var body) => List<Episode>.from(body.map((i) => Episode.fromJson(i)));

class AllEpisodes {
  final Info? info;
  final List<Episode>? results;

  AllEpisodes({
    this.info,
    this.results,
  });

  factory AllEpisodes.fromJson(Map<String, dynamic> json) {
    return AllEpisodes(
      info: Info.fromJson(json["info"]),
      results: List<Episode>.from(json["results"].map((x) => Episode.fromJson(x))),
    );
  }
}

class Episode {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json["id"],
      name: json["name"],
      airDate: json["air_date"],
      episode: json["episode"],
      characters: List<String>.from(json["characters"].map((x) => x)),
      url: json["url"],
      created: DateTime.parse(json["created"]),
    );
  }
}
