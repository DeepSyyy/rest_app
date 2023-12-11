import 'package:rest_app/feature/restaurant_detail/business/entities/sub_entity/customer_review_entity.dart';

class CustomerReviewListEntity {
  final bool error;
  final String message;
  final List<CustomerReviewEntity> customerReviews;

  CustomerReviewListEntity({
    required this.error,
    required this.message,
    required this.customerReviews,
  });
}
