import 'package:dartz/dartz.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/core/params/params.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/main_entity/customer_review_main.dart';
import 'package:rest_app/feature/restaurant_detail/business/repository/restaurant_detail_repository.dart';

class PostReview {
  final RestaurantDetailRepository repository;

  PostReview(this.repository);

  Future<Either<Failure, CustomerReviewListEntity>> call(
      {required PostReviewParams params}) async {
    return await repository.postReview(params: params);
  }
}
