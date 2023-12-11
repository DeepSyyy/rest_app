import 'dart:convert';

import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/category_list_entity.dart';

class CategoryModel extends CategoryEntity {
  final String name;

  CategoryModel({
    required this.name,
  }) : super(name: name);

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
