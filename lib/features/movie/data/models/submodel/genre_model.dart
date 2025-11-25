import 'package:movie_app/features/movie/domain/entities/subentity/genre_entity.dart';

class GenreModel extends GenreEntity {
  GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(id: json["id"] ?? 0, name: json["name"] ?? '');
  }

  /// تحويل Model → JSON
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }
}
