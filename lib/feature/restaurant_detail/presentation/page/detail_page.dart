import 'package:flutter/material.dart';
import 'package:rest_app/feature/restaurant_detail/presentation/widget/detail_component.dart';

class DetailRestaurantView extends StatelessWidget {
  const DetailRestaurantView({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return DetailComponent(
      restaurantId: restaurantId,
    );
  }
}
