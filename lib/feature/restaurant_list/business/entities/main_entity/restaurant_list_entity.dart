import 'package:rest_app/feature/restaurant_list/business/entities/sub_entity/restaurant_entity.dart';

class RestaurantListEntity {
  final bool error;
  final String message;
  final int count;
  final List<RestaurantEntity> restaurants;

  RestaurantListEntity({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });
}
