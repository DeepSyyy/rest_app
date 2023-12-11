import 'dart:convert';

import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/food_entity.dart';

class FoodModel extends FoodEntity {
  final String name;

  FoodModel({
    required this.name,
  }) : super(
          name: name,
        );

  factory FoodModel.fromJson(String str) => FoodModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FoodModel.fromMap(Map<String, dynamic> json) => FoodModel(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
