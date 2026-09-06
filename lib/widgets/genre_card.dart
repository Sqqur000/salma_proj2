import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenreCard extends StatelessWidget {

  final String title;
  final String image;

  const GenreCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 120,
      width: 120,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.45),
              ),
            ),
            Center(
              child: Text(
                title,
                style: GoogleFonts.rajdhani(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}