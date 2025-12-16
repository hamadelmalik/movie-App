// data/models/category_model.dart

import 'package:movie_app/features/home/domain/entity/genres_entity.dart';

class GenresModel extends GenresEntity {
  GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
