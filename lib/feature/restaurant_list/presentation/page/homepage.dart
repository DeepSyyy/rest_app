import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/feature/restaurant_list/business/entities/main_entity/restaurant_list_entity.dart';
import 'package:rest_app/feature/restaurant_list/presentation/provider/restaurant_list_provider.dart';
import 'package:rest_app/feature/restaurant_list/presentation/widget/restaurant_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantListEntity? restaurantListEntity =
        Provider.of<RestaurantListProvider>(context).restaurantListEntity;
    Failure? failure = Provider.of<RestaurantListProvider>(context).failure;
    late Widget widget;
    if (restaurantListEntity != null) {
      widget = ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: restaurantListEntity.restaurants.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: RestaurantCard(
              restaurantId: restaurantListEntity.restaurants[index].id,
              image: restaurantListEntity.restaurants[index].pictureId,
              restaurantName: restaurantListEntity.restaurants[index].name,
              restaurantLocation: restaurantListEntity.restaurants[index].city,
              restaurantRating:
                  restaurantListEntity.restaurants[index].rating.toDouble(),
              restaurantDescription:
                  restaurantListEntity.restaurants[index].description,
            ),
          );
        },
      );
    } else if (failure != null) {
      widget = Center(
        child: Text(failure.errorMessage),
      );
    } else {
      widget = Center(
        child: CircularProgressIndicator(),
      );
    }
    return widget;
  }
}
