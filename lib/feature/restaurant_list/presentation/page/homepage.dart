import 'package:flutter/material.dart';
import 'package:rest_app/feature/restaurant_list/presentation/widget/data_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RestaurantListData();
  }
}
