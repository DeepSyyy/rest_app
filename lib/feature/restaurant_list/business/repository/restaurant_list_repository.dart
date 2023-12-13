import 'package:dartz/dartz.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/feature/restaurant_list/business/entities/main_entity/restaurant_list_entity.dart';

abstract class RestaurantListRepository {
  Future<Either<Failure, RestaurantListEntity>> getRestaurantList();
}
