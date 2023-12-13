import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rest_app/core/error/failure.dart';
import 'package:rest_app/core/params/params.dart';
import 'package:rest_app/feature/restaurant_detail/business/entities/main_entity/restaurant_detail_entity.dart';
import 'package:rest_app/feature/restaurant_detail/data/datasource/restaurant_list_remote_data_source.dart';
import 'package:rest_app/feature/restaurant_detail/data/repository/restaurant_detail_repository_impl.dart';
import 'package:rest_app/feature/restaurant_detail/presentation/provider/restaurant_detail_provider.dart';
import 'package:rest_app/feature/restaurant_detail/presentation/widget/drink_card.dart';
import 'package:rest_app/feature/restaurant_detail/presentation/widget/food_card.dart';
import 'package:rest_app/feature/restaurant_detail/presentation/widget/review_post_component.dart';
import 'package:rest_app/feature/restaurant_detail/presentation/widget/review_tile.dart';

class DetailComponent extends StatefulWidget {
  const DetailComponent({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  State<DetailComponent> createState() => _DetailComponentState();
}

class _DetailComponentState extends State<DetailComponent> {
  TextEditingController textEditingController = TextEditingController();
  void initState() {
    Provider.of<RestaurantDetailProvider>(context, listen: false)
        .eitherFailureOrRestaurantDetail(value: widget.restaurantId);
    super.initState();
  }

  void _submitReview(BuildContext context) async {
    final reviewText = textEditingController.text;

    if (reviewText.isNotEmpty) {
      final result = await RestaurantDetailRepositoryImpl(
        remoteDataSource: RestaurantDetailRemoteDataSourceImpl(
          dio: Dio(),
        ),
      ).postReview(
        params: PostReviewParams(
          id: widget.restaurantId,
          name: "John Doe",
          review: reviewText,
        ),
      );

      result.fold((failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }, (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Review berhasil ditambahkan"),
            backgroundColor: Colors.green,
          ),
        );
        textEditingController.clear();
        setState(() {
          Provider.of<RestaurantDetailProvider>(context, listen: false)
              .eitherFailureOrRestaurantDetail(value: widget.restaurantId);
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Review tidak boleh kosong"),
          backgroundColor: Colors.yellow,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    RestaurantDetailEntity? restaurantDetailEntity =
        Provider.of<RestaurantDetailProvider>(context).restaurantDetailEntity;
    Failure? failure = Provider.of<RestaurantDetailProvider>(context).failure;
    late Widget widget;
    if (restaurantDetailEntity != null) {
      widget = ListView(
        padding: EdgeInsets.all(18),
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    "https://restaurant-api.dicoding.dev/images/large/${restaurantDetailEntity.restaurant.pictureId}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            restaurantDetailEntity.restaurant.name,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                restaurantDetailEntity.restaurant.city,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                restaurantDetailEntity.restaurant.rating.toString(),
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Description",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            restaurantDetailEntity.restaurant.description,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.clip,
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Menu",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Foods",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurantDetailEntity.restaurant.menus.foods.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FoodCard(
                      title: restaurantDetailEntity
                          .restaurant.menus.foods[index].name),
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Drinks",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurantDetailEntity.restaurant.menus.drinks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DrinkCard(
                      title: restaurantDetailEntity
                          .restaurant.menus.drinks[index].name),
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Reviews",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          PostreviewComponent(
              controller: textEditingController,
              handler: (reviewText) {
                _submitReview(context);
              }),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 300,
            child: ListView.builder(
                itemCount:
                    restaurantDetailEntity.restaurant.customerReviews.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ReviewTile(
                      nama: restaurantDetailEntity
                          .restaurant.customerReviews[index].name,
                      review: restaurantDetailEntity
                          .restaurant.customerReviews[index].review,
                      tanggal: restaurantDetailEntity
                          .restaurant.customerReviews[index].date,
                    ),
                  );
                }),
          )
        ],
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
