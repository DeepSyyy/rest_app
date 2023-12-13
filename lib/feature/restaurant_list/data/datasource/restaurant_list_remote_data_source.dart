import 'package:dio/dio.dart';
import 'package:rest_app/core/error/exception.dart';
import 'package:rest_app/feature/restaurant_list/data/models/main_model/restaurant_list_model.dart';

abstract class RestaurantListRemoteDataSource {
  Future<RestaurantListModel> getRestaurantList();
}

class RestaurantListRemoteDataSourceImpl
    extends RestaurantListRemoteDataSource {
  RestaurantListRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<RestaurantListModel> getRestaurantList() async {
    final response = await dio.get('https://restaurant-api.dicoding.dev/list');
    if (response.statusCode == 200) {
      return RestaurantListModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
