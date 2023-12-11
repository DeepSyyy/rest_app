import 'dart:convert';

import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/drink_entity.dart';

class DrinkModel extends DrinkEntity {
  final String name;

  DrinkModel({
    required this.name,
  }) : super(name: name);

  factory DrinkModel.fromJson(String str) =>
      DrinkModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DrinkModel.fromMap(Map<String, dynamic> json) => DrinkModel(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
