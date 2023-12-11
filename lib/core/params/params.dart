class RestaurantDetailParams {
  final String id;

  RestaurantDetailParams({required this.id});
}

class PostReviewParams {
  final String id;
  final String name;
  final String review;

  PostReviewParams({
    required this.id,
    required this.name,
    required this.review,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'review': review,
    };
  }
}
