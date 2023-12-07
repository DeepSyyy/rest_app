import 'dart:convert';

class Food {
  final String name;

  Food({
    required this.name,
  });

  factory Food.fromJson(String str) => Food.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Food.fromMap(Map<String, dynamic> json) => Food(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
