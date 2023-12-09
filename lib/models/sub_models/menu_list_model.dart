import 'dart:convert';

import 'package:rest_app/models/sub_models/drink_list_model.dart';
import 'package:rest_app/models/sub_models/food_list_model.dart';

class Menu {
  final List<Food> foods;
  final List<Drink> drinks;

  Menu({
    required this.foods,
    required this.drinks,
  });

  factory Menu.fromJson(String str) => Menu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Menu.fromMap(Map<String, dynamic> json) => Menu(
        foods: List<Food>.from(json["foods"].map((x) => Food.fromMap(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toMap())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toMap())),
      };
}
