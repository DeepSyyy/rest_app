import 'package:dartz/dartz.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/feature/restaurant_list/business/entities/main_entity/restaurant_list_entity.dart';
import 'package:rest_app/feature/restaurant_list/business/repository/restaurant_list_repository.dart';

class GetRestaurantList {
  final RestaurantListRepository repository;

  GetRestaurantList(this.repository);

  Future<Either<Failure, RestaurantListEntity>> call() async {
    return await repository.getRestaurantList();
  }
}
