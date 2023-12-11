import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/category_list_entity.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/customer_review_entity.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/menu_entity.dart';

class RestaurantEntity {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<CategoryEntity> categories;
  final MenusEntity menus;
  final double rating;
  final List<CustomerReviewEntity> customerReviews;

  RestaurantEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });
}
