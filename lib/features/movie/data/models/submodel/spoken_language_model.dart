import 'package:movie_app/features/movie/domain/entities/subentity/spoken_language_entity.dart';

class SpokenLanguageMoel extends SpokenLanguageEntity {
  SpokenLanguageMoel({required super.isoCode, required super.name});

  factory SpokenLanguageMoel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageMoel(
      isoCode: json["iso_639_1"] ?? '',
      name: json["name"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {"iso_639_1": isoCode, "name": name};
  }
}
