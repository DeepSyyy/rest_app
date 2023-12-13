import 'dart:convert';

import 'package:rest_app/feature/restaurant_list/data/models/sub_model/restaurant_model.dart';
import 'package:rest_app/feature/restaurant_list/business/entities/main_entity/restaurant_list_entity.dart';

class RestaurantListModel extends RestaurantListEntity {
  final bool error;
  final String message;
  final int count;
  final List<RestaurantModel> restaurants;

  RestaurantListModel({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  }) : super(
          error: error,
          message: message,
          count: count,
          restaurants: restaurants,
        );

  factory RestaurantListModel.fromJson(Map<String, dynamic> json) =>
      RestaurantListModel.fromMap(json);

  String toJson() => json.encode(toMap());

  factory RestaurantListModel.fromMap(Map<String, dynamic> json) =>
      RestaurantListModel(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<RestaurantModel>.from(
            json["restaurants"].map((x) => RestaurantModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toMap())),
      };
}
