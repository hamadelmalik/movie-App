import 'package:movie_app/features/movie/domain/entities/subentity/production_company_entity.dart';

class ProductionCompanyModel extends ProductionCompanyEntity {
  ProductionCompanyModel({required super.id, required super.name});

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }
}
