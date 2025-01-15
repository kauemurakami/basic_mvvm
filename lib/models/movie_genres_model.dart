// To parse this JSON data, do
//
//     final genreModel = genreModelFromJson(jsonString);

import 'dart:convert';

MovieGenreModel genreModelFromJson(String str) => MovieGenreModel.fromJson(json.decode(str));

String genreModelToJson(MovieGenreModel data) => json.encode(data.toJson());

class MovieGenreModel {
  int id;
  String name;

  MovieGenreModel({
    required this.id,
    required this.name,
  });

  factory MovieGenreModel.fromJson(Map<String, dynamic> json) => MovieGenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() {
    return "MovieGenreModel(id: $id, name: $name)";
  }
}
