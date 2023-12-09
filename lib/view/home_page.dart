import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_app/models/main_models/restaurant_list.dart';
import 'package:rest_app/view/widget/restaurant_card.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RestApp",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: const Icon(
          Icons.restaurant,
          color: Colors.black,
          size: 30,
        ),
      ),
      body: loadingState == LoadingState.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : loadingState == LoadingState.hasData
              ? ListView.builder(
                  itemCount: restaurants.restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants.restaurants[index];
                    return RestaurantCard(
                      restaurant: restaurant,
                    );
                  },
                )
              : const Center(
                  child: Text("Error"),
                ),
    );
  }
}
