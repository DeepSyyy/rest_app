import 'package:flutter/material.dart';
import 'package:rest_app/models/main_models/restaurant_list.dart';
import 'package:rest_app/view/widget/restaurant_card.dart';
import 'package:rest_app/view/widget/search_bar.dart';

enum LoadingState {
  loading,
  hasData,
  error,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Restaurants restaurants;
  LoadingState loadingState = LoadingState.loading;

  void getRestaurants() async {
    try {
      final response = await DefaultAssetBundle.of(context)
          .loadString("assets/data/local_restaurant.json");
      final data = Restaurants.fromJson(response);
      setState(() {
        restaurants = data;
        loadingState = LoadingState.hasData;
      });
    } catch (e) {
      setState(() {
        loadingState = LoadingState.error;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, isScroll) {
        return [
          const SearchBarAppBarr(),
        ];
      },
      body: loadingState == LoadingState.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : loadingState == LoadingState.hasData
              ? ListView.builder(
                  itemCount: restaurants.restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants.restaurants[index];
                    return RestaurantsCard(
                      restaurantName: restaurant.name,
                      restaurantPlace: restaurant.city,
                      restaurantImage: restaurant.pictureId,
                      restaurantRating: restaurant.rating.toString(),
                      restaurantDesc: restaurant.description,
                    );
                  },
                )
              : const Center(
                  child: Text("Error"),
                ),
    );
  }
}
