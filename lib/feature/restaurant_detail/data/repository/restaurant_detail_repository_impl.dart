import 'package:dartz/dartz.dart';
import 'package:rest_app/core/error/exception.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/core/params/params.dart';
import 'package:rest_app/feature/restaurant_detail/business/repository/restaurant_detail_repository.dart';
import 'package:rest_app/feature/restaurant_detail/data/datasource/restaurant_list_remote_data_source.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/main_model/customer_review_model.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/main_model/restaurant_detail_model.dart';

class RestaurantDetailRepositoryImpl extends RestaurantDetailRepository {
  final RestaurantDetailRemoteDataSource remoteDataSource;

  RestaurantDetailRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, RestaurantDetailModel>> getRestaurantDetail(
      {required RestaurantDetailParams params}) async {
    try {
      final result = await remoteDataSource.getRestaurantDetail(params: params);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'Server Error'));
    }
  }

  @override
  Future<Either<Failure, CustomerReviewListModel>> postReview(
      {required PostReviewParams params}) async {
    try {
      final result = await remoteDataSource.postReview(
        params: params,
      );
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'Server Error'));
    }
  }
}
