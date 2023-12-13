import 'package:dartz/dartz.dart';
import 'package:rest_app/core/error/exception.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/feature/restaurant_list/business/repository/restaurant_list_repository.dart';
import 'package:rest_app/feature/restaurant_list/data/datasource/restaurant_list_remote_data_source.dart';
import 'package:rest_app/feature/restaurant_list/data/models/main_model/restaurant_list_model.dart';

class RestaurantListRepositoryImpl extends RestaurantListRepository {
  final RestaurantListRemoteDataSource remoteDataSource;

  RestaurantListRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, RestaurantListModel>> getRestaurantList() async {
    try {
      final result = await remoteDataSource.getRestaurantList();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'Server Error'));
    }
  }
}
