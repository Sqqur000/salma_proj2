import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlatformCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const PlatformCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 120,
      child: Card(
        color: Colors.grey.withOpacity(0.3),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rajdhani(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               SizedBox(height: 5),
                Icon(
                  icon,
                  color: Colors.white70,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}