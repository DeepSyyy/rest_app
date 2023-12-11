import 'package:dartz/dartz.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/core/params/params.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/main_entity/restaurant_detail_entity.dart';
import 'package:rest_app/feature/restaurant_detail/business/repository/restaurant_detail_repository.dart';

class GetRestaurantDetail {
  final RestaurantDetailRepository repository;

  GetRestaurantDetail(this.repository);

  Future<Either<Failure, RestaurantDetailEntity>> call(
      {required RestaurantDetailParams params}) async {
    return await repository.getRestaurantDetail(params: params);
  }
}
