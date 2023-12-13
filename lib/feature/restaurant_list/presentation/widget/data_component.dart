import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/feature/restaurant_list/business/entities/main_entity/restaurant_list_entity.dart';
import 'package:rest_app/feature/restaurant_list/presentation/provider/restaurant_list_provider.dart';

class RestaurantListData extends StatelessWidget {
  const RestaurantListData({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantListEntity? restaurantListEntity =
        Provider.of<RestaurantListProvider>(context).restaurantListEntity;
    Failure? failure = Provider.of<RestaurantListProvider>(context).failure;
    late Widget widget;
    if (restaurantListEntity != null) {
      widget = ListView.builder(
        itemCount: restaurantListEntity.restaurants.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(restaurantListEntity.restaurants[index].name),
          );
        },
      );
    } else if (failure != null) {
      widget = Text(failure.errorMessage);
    } else {
      widget = Center(
        child: Lottie.asset("assets/lottie/loading-animation.json"),
      );
    }
    return widget;
  }
}
