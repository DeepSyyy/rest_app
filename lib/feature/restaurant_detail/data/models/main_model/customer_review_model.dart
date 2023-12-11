import 'dart:convert';

import 'package:rest_app/feature/restaurant_detail/business/entities/main_entity/customer_review_main.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/sub_model/customer_review_model.dart';

class CustomerReviewListModel extends CustomerReviewListEntity {
  final bool error;
  final String message;
  final List<CustomerReviewModel> customerReviews;

  CustomerReviewListModel({
    required this.error,
    required this.message,
    required this.customerReviews,
  }) : super(
          error: error,
          message: message,
          customerReviews: customerReviews,
        );

  factory CustomerReviewListModel.fromJson(String str) =>
      CustomerReviewListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerReviewListModel.fromMap(Map<String, dynamic> json) =>
      CustomerReviewListModel(
        error: json["error"],
        message: json["message"],
        customerReviews: List<CustomerReviewModel>.from(
            json["customerReviews"].map((x) => CustomerReviewModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "customerReviews":
            List<dynamic>.from(customerReviews.map((x) => x.toMap())),
      };
}
