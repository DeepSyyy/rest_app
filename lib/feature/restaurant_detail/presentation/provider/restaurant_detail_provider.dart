import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/core/params/params.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/main_entity/customer_review_main.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/main_entity/restaurant_detail_entity.dart';
import 'package:rest_app/feature/restaurant_detail/business/usecase/get_restaurant_detail.dart';
import 'package:rest_app/feature/restaurant_detail/business/usecase/post_review.dart';
import 'package:rest_app/feature/restaurant_detail/data/datasource/restaurant_list_remote_data_source.dart';
import 'package:rest_app/feature/restaurant_detail/data/repository/restaurant_detail_repository_impl.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  RestaurantDetailEntity? restaurantDetailEntity;
  CustomerReviewListEntity? customerReviewListEntity;
  Failure? failure;

  RestaurantDetailProvider({
    this.restaurantDetailEntity,
    this.failure,
  });

  void postReview({
    required String id,
    required String name,
    required String review,
  }) async {
    try {
      RestaurantDetailRepositoryImpl repo = RestaurantDetailRepositoryImpl(
        remoteDataSource: RestaurantDetailRemoteDataSourceImpl(
          dio: Dio(),
        ),
      );
      final failureOrCustomerReviewListModel = await PostReview(repo).call(
        params: PostReviewParams(
          id: id,
          name: name,
          review: review,
        ),
      );

      failureOrCustomerReviewListModel.fold((newFailure) {
        failure = newFailure;
        notifyListeners();
      }, (newCustomerReviewListModel) {
        customerReviewListEntity = newCustomerReviewListModel;
        notifyListeners();
      });
    } catch (e) {
      failure =
          ServerFailure(errorMessage: "Server Failure, please try again later");
      notifyListeners();
    }
  }

  void eitherFailureOrRestaurantDetail({
    required String value,
  }) async {
    try {
      RestaurantDetailRepositoryImpl repo = RestaurantDetailRepositoryImpl(
        remoteDataSource: RestaurantDetailRemoteDataSourceImpl(
          dio: Dio(),
        ),
      );
      final failureOrRestaurantDetail = await GetRestaurantDetail(repo).call(
        params: RestaurantDetailParams(id: value),
      );

      failureOrRestaurantDetail.fold((newFailure) {
        failure = newFailure;
        notifyListeners();
      }, (newRestaurantDetail) {
        restaurantDetailEntity = newRestaurantDetail;
        notifyListeners();
      });
    } catch (e) {
      failure =
          ServerFailure(errorMessage: "Server Failure, please try again later");
      notifyListeners();
    }
  }
}
