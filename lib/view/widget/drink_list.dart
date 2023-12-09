import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DrinkListContainer extends StatelessWidget {
  const DrinkListContainer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 200,
        maxHeight: 100,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black26,
        ),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svg/cherry drink-amico.svg',
            width: 100,
            height: 100,
          ),
          const Divider(
            color: Colors.black26,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
