import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salma_proj2/widgets/game_background.dart';
import 'package:salma_proj2/widgets/genre_card.dart';
import 'package:salma_proj2/widgets/platform_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
          'Search',
          style: GoogleFonts.audiowide(
            color: Colors.white,
            fontSize: screenWidth * 0.05,
          ),
        ),
      ),

      body: GameBackground(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.13),
                  Container(
                    height: screenHeight * 0.065,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Icon(Icons.search, color: Colors.white70),
                        SizedBox(width: 10),

                        Text(
                          'Search',
                          style: GoogleFonts.rajdhani(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),

                        Spacer(),
                        Icon(Icons.filter_list, color: Colors.white70),
                        SizedBox(width: 15),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    'Genres',
                    style: GoogleFonts.audiowide(
                      color: Color.fromARGB(255, 238, 244, 173),
                      fontSize: 25,
                    ),
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      GenreCard(
                        title: 'Action',
                        image: 'assets/OIP.webp',
                      ),
                      GenreCard(
                        title: 'Strategy',
                        image: 'assets/Strategy.webp',
                      ),
                      GenreCard(
                        title: 'RPG', image: 'assets/1733019437_les-rpg-immersion-et-developpement-de-personnage-dans-le-vaste-univers-des-genres-videoludiques.jpg'),
                      GenreCard(
                        title: 'Shooter',
                        image: 'assets/ss_a0389cccc74b3bb7c7888a5be7b415861353e418.1920x1080.jpg',
                      ),
                      GenreCard(
                        title: 'Adventure',
                        image: 'assets/Top-10-Action_Adventure-Game-Franchises-That-Defined-a-Generation.jpg',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GenreCard(
                        title: 'Puzzle',
                        image: 'assets/Why-Tetris-Creator-never-Made-Tetris-2.jpeg',
                      ),
                      GenreCard(
                        title: 'Racing',
                        image: 'assets/81Gw5AQ04tL.jpg',
                      ),
                      GenreCard(
                        title: 'Sports',
                        image: 'assets/OIP (1).webp',
                      ),
                      GenreCard(
                        title: 'Simulation',
                        image: 'assets/OIP (2).webp',
                      ),
                      GenreCard(
                        title: 'Horror',
                        image: 'assets/Horror_Game_Development_Company.webp',
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Platforms',
                    style: GoogleFonts.audiowide(
                      color: Color.fromARGB(255, 238, 244, 173),
                      fontSize: 25,
                    ),
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      PlatformCard(title: 'PC', icon: Icons.window),
                      PlatformCard(title: 'PlayStation 5', icon: Icons.gamepad),
                      PlatformCard(title: 'Xbox', icon: Icons.sports_esports),
                      PlatformCard(title: 'Mobile', icon: Icons.phone_android),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
