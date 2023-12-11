import 'dart:convert';

import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/menu_entity.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/sub_model/drink_list_model.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/sub_model/food_list_model.dart';

class MenusModel extends MenusEntity {
  final List<FoodModel> foods;
  final List<DrinkModel> drinks;

  MenusModel({
    required this.foods,
    required this.drinks,
  }) : super(
          foods: foods,
          drinks: drinks,
        );

  factory MenusModel.fromJson(String str) =>
      MenusModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MenusModel.fromMap(Map<String, dynamic> json) => MenusModel(
        foods: List<FoodModel>.from(
            json["foods"].map((x) => FoodModel.fromMap(x))),
        drinks: List<DrinkModel>.from(
            json["drinks"].map((x) => DrinkModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toMap())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toMap())),
      };
}
