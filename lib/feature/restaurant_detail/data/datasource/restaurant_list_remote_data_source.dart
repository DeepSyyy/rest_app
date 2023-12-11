import 'package:rest_app/core/const/constant.dart';
import 'package:rest_app/core/error/exception.dart';
import 'package:rest_app/core/params/params.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/main_model/customer_review_model.dart';
import 'package:rest_app/feature/restaurant_detail/data/models/main_model/restaurant_detail_model.dart';
import 'package:dio/dio.dart';

abstract class RestaurantDetailRemoteDataSource {
  Future<RestaurantDetailModel> getRestaurantDetail(
      {required RestaurantDetailParams params});
  Future<CustomerReviewListModel> postReview(
      {required PostReviewParams params});
}

class RestaurantDetailRemoteDataSourceImpl
    extends RestaurantDetailRemoteDataSource {
  RestaurantDetailRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<RestaurantDetailModel> getRestaurantDetail(
      {required RestaurantDetailParams params}) async {
    final response = await dio
        .get('https://restaurant-api.dicoding.dev/detail/${params.id}');
    print(response);
    if (response.statusCode == 200) {
      return RestaurantDetailModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CustomerReviewListModel> postReview(
      {required PostReviewParams params}) async {
    final response = await dio.post('${BASEURL}/review', data: params.toJson());
    if (response.statusCode == 201) {
      return CustomerReviewListModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
