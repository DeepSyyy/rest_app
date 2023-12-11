import 'dart:convert';

import 'package:rest_app/feature/restaurant_detail/business/entities/main_entity/restaurant_detail_entity.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/sub_model/restaurant_model.dart';

class RestaurantDetailModel extends RestaurantDetailEntity {
  final bool error;
  final String message;
  final RestaurantModel restaurant;

  RestaurantDetailModel({
    required this.error,
    required this.message,
    required this.restaurant,
  }) : super(
          error: error,
          message: message,
          restaurant: restaurant,
        );

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailModel.fromMap(json);

  String toJson() => json.encode(toMap());

  factory RestaurantDetailModel.fromMap(Map<String, dynamic> json) =>
      RestaurantDetailModel(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantModel.fromMap(json["restaurant"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "restaurant": restaurant.toMap(),
      };
}
