import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/drink_entity.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/food_entity.dart';

class MenusEntity {
  final List<FoodEntity> foods;
  final List<DrinkEntity> drinks;

  MenusEntity({
    required this.foods,
    required this.drinks,
  });
}
