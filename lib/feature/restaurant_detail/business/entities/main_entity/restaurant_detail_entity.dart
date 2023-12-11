import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/restaurant_entity.dart';

class RestaurantDetailEntity {
  final bool error;
  final String message;
  final RestaurantEntity restaurant;

  RestaurantDetailEntity({
    required this.error,
    required this.message,
    required this.restaurant,
  });
}
