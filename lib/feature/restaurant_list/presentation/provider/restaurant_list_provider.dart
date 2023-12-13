import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/feature/restaurant_list/business/entities/main_entity/restaurant_list_entity.dart';
import 'package:rest_app/feature/restaurant_list/business/usecase/get_restaurant_list.dart';
import 'package:rest_app/feature/restaurant_list/data/datasource/restaurant_list_remote_data_source.dart';
import 'package:rest_app/feature/restaurant_list/data/repository/restaurant_list_repository.dart';

class RestaurantListProvider extends ChangeNotifier {
  RestaurantListEntity? restaurantListEntity;
  Failure? failure;

  RestaurantListProvider({this.restaurantListEntity, this.failure});

  void eitherFailureOrRestaurantList() async {
    try {
      RestaurantListRepositoryImpl repo = RestaurantListRepositoryImpl(
        remoteDataSource: RestaurantListRemoteDataSourceImpl(
          dio: Dio(),
        ),
      );
      final failureOrRestaurantList = await GetRestaurantList(repo).call();

      failureOrRestaurantList.fold((newFailure) {
        failure = newFailure;
        notifyListeners();
      }, (newRestaurantList) {
        restaurantListEntity = newRestaurantList;
        notifyListeners();
      });
    } catch (e) {
      failure =
          ServerFailure(errorMessage: "Server Failure, please try again later");
      notifyListeners();
    }
  }
}
