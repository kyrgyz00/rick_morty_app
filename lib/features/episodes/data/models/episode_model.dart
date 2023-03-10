// To parse this JSON data, do
//
//     final episodeModel = episodeModelFromJson(jsonString);

import 'dart:convert';

class EpisodeModel {
    EpisodeModel({
        this.id,
        this.name,
        this.airDate,
        this.episode,
        this.characters,
        this.url,
        this.created,
    });

    final int? id;
    final String? name;
    final String ?airDate;
    final String ?episode;
    final List<String>? characters;
    final String ?url;
    final DateTime? created;

    factory EpisodeModel.fromRawJson(String str) => EpisodeModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters!.map((x) => x)),
        "url": url,
        "created": created!.toIso8601String(),
    };
}
