import 'package:flutter/material.dart';
import 'package:salma_proj2/models/game_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:salma_proj2/services/api.dart';
import 'package:salma_proj2/widgets/game_background.dart';

class DetailsScreen extends StatelessWidget {
  final GameModel gameId;
  const DetailsScreen({super.key, required this.gameId});

  String cleanDescription(String description) {
    return description.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<GameModel>(
      future: Api().getDetails(gameId.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: GameBackground(
              child: Center(
                child: LoadingAnimationWidget.flickr(
                  leftDotColor: Colors.red.shade700,
                  rightDotColor: Colors.green.shade700,
                  size: 30,
                ),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: GameBackground(
              child: Center(
                child: Text(
                  'Oops Something went wrong!',
                  style: GoogleFonts.rajdhani(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Scaffold(
            body: GameBackground(
              child: const Center(
                child: Text(
                  'No game found',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }

        GameModel game = snapshot.data!;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: screenWidth * 0.065,
              ),
            ),
            centerTitle: true,
            title: Text(
              game.name ?? 'Game Details',
              style: GoogleFonts.audiowide(color: Colors.white, fontSize: 18),
            ),
            actions: [
              Icon(Icons.shopping_cart_outlined, color: Colors.white),
              SizedBox(width: screenWidth * 0.02),
            ],
          ),
          body: GameBackground(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: screenHeight * 0.12),
                  Image.network(
                    game.backgroundImage ?? 'assets/R.jpg',
                    width: double.infinity,
                    height: screenHeight * 0.32,
                    fit: BoxFit.cover,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          game.name ?? 'Unknown Game',
                          style: GoogleFonts.audiowide(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 25),

                            SizedBox(width: screenWidth * 0.015),

                            Text(
                              '${game.rating ?? 0}',
                              style: GoogleFonts.rajdhani(
                                color: const Color.fromARGB(255, 238, 244, 173),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: screenHeight * 0.02),

                        Text(
                          'Released: ${game.released ?? 'Unknown'}',
                          style: GoogleFonts.rajdhani(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.012),

                        Text(
                          'Metacritic: ${game.metacritic ?? 'N/A'}',
                          style: GoogleFonts.rajdhani(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        Text(
                          'Description',
                          style: GoogleFonts.audiowide(
                            color: const Color.fromARGB(255, 238, 244, 173),
                            fontSize: 25,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.015),

                        Text(
                          cleanDescription(
                            game.description ?? 'No description available',
                          ),
                          style: GoogleFonts.rajdhani(
                            color: Colors.white,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.04),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
                      
  

  

