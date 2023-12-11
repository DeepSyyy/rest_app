import 'dart:convert';

import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/restaurant_entity.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/sub_model/category_list_model.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/sub_model/customer_review_model.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/sub_model/menu_list_model.dart';

class RestaurantModel extends RestaurantEntity {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<CategoryModel> categories;
  final MenusModel menus;
  final double rating;
  final List<CustomerReviewModel> customerReviews;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  }) : super(
          id: id,
          name: name,
          description: description,
          city: city,
          address: address,
          pictureId: pictureId,
          categories: categories,
          menus: menus,
          rating: rating,
          customerReviews: customerReviews,
        );

  factory RestaurantModel.fromJson(String str) =>
      RestaurantModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromMap(Map<String, dynamic> json) => RestaurantModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromMap(x))),
        menus: MenusModel.fromMap(json["menus"]),
        rating: json["rating"]?.toDouble(),
        customerReviews: List<CustomerReviewModel>.from(
            json["customerReviews"].map((x) => CustomerReviewModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
        "menus": menus.toMap(),
        "rating": rating,
        "customerReviews":
            List<dynamic>.from(customerReviews.map((x) => x.toMap())),
      };
}
