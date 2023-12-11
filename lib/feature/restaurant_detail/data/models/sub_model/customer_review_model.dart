import 'dart:convert';

import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/customer_review_entity.dart';

class CustomerReviewModel extends CustomerReviewEntity {
  final String name;
  final String review;
  final String date;

  CustomerReviewModel({
    required this.name,
    required this.review,
    required this.date,
  }) : super(
          name: name,
          review: review,
          date: date,
        );

  factory CustomerReviewModel.fromJson(String str) =>
      CustomerReviewModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerReviewModel.fromMap(Map<String, dynamic> json) =>
      CustomerReviewModel(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "review": review,
        "date": date,
      };
}
