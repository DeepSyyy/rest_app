import 'dart:convert';

import 'package:rest_app/models/sub_models/restaurant_model.dart';

class Restaurants {
  final List<Restaurant> restaurants;

  Restaurants({
    required this.restaurants,
  });

  factory Restaurants.fromJson(String str) =>
      Restaurants.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Restaurants.fromMap(Map<String, dynamic> json) => Restaurants(
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toMap())),
      };
}
