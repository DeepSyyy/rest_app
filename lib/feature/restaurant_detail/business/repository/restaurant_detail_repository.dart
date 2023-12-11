import 'package:dartz/dartz.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/core/params/params.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/main_entity/customer_review_main.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/main_entity/restaurant_detail_entity.dart';

abstract class RestaurantDetailRepository {
  Future<Either<Failure, RestaurantDetailEntity>> getRestaurantDetail(
      {required RestaurantDetailParams params});

  Future<Either<Failure, CustomerReviewListEntity>> postReview(
      {required PostReviewParams params});
}
