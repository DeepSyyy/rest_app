import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_app/view/widget/gradient_text.dart';

class SearchBarAppBarr extends StatefulWidget {
  const SearchBarAppBarr({super.key});

  @override
  State<SearchBarAppBarr> createState() => _SearchBarAppBarrState();
}

class _SearchBarAppBarrState extends State<SearchBarAppBarr> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
          ),
        ),
      ),
      expandedHeight: 200,
      pinned: true,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: GradientText(
            "Rest App",
            gradient: const LinearGradient(colors: [
              Color(0xffFD1DFC),
              Color(0xff833AB4),
            ]),
            style: GoogleFonts.poppins(
              fontSize: 30,
            ),
          )),
    );
  }
}
