import 'package:flutter/widgets.dart';
import 'package:rest_app/models/sub_models/restaurant_model.dart';
import 'package:rest_app/view/widget/detail_component.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return DetailPageComponent(
      restaurant: restaurant,
    );
  }
}
