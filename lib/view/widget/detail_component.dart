import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_app/models/sub_models/restaurant_model.dart';
import 'package:rest_app/view/widget/drink_list.dart';
import 'package:rest_app/view/widget/food_list.dart';

class DetailPageComponent extends StatefulWidget {
  const DetailPageComponent({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<DetailPageComponent> createState() => _DetailPageComponentState();
}

class _DetailPageComponentState extends State<DetailPageComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              widget.restaurant.name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        clipBehavior: Clip.none,
        children: [
          Hero(
            tag: widget.restaurant.id,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.restaurant.pictureId),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.restaurant.name,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.restaurant.city,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
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
                widget.restaurant.rating.toString(),
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Deskripsi Restaurant",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            child: Text(
              widget.restaurant.description,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.justify,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Menu Makanan",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 200,
            clipBehavior: Clip.none,
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: widget.restaurant.menus.foods.length,
              itemBuilder: (context, index) {
                final Restaurant restaurant = widget.restaurant;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: FoodListContainer(
                      title: restaurant.menus.foods[index].name),
                );
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Menu Minuman",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 200,
            clipBehavior: Clip.none,
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: widget.restaurant.menus.drinks.length,
              itemBuilder: (context, index) {
                final Restaurant restaurant = widget.restaurant;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DrinkListContainer(
                      title: restaurant.menus.drinks[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
