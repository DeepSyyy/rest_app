import 'dart:convert';
import 'package:rest_app/feature/restaurant_list/business/entities/sub_entity/restaurant_entity.dart';

class RestaurantModel extends RestaurantEntity {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  }) : super(
          id: id,
          name: name,
          description: description,
          pictureId: pictureId,
          city: city,
          rating: rating,
        );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel.fromMap(json);

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromMap(Map<String, dynamic> json) => RestaurantModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
