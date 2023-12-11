import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/main_entity/restaurant_detail_entity.dart';
import 'package:rest_app/feature/restaurant_detail/presentation/provider/restaurant_detail_provider.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantDetailEntity? restaurantDetailEntity =
        Provider.of<RestaurantDetailProvider>(context).restaurantDetailEntity;
    Failure? failure = Provider.of<RestaurantDetailProvider>(context).failure;
    late Widget widget;
    if (restaurantDetailEntity != null) {
      widget = SingleChildScrollView(
        child: Column(
          children: [
            Text(restaurantDetailEntity.restaurant.id),
            Text(restaurantDetailEntity.restaurant.name),
            Text(restaurantDetailEntity.restaurant.description),
            Text(restaurantDetailEntity.restaurant.city),
            Text(restaurantDetailEntity.restaurant.address),
            Text(restaurantDetailEntity.restaurant.pictureId),
            Text(restaurantDetailEntity.restaurant.rating.toString()),
            Text(restaurantDetailEntity.restaurant.menus.foods[0].name),
          ],
        ),
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
