import 'package:flutter/material.dart';
import 'package:salma_proj2/models/game_model.dart';
import 'package:salma_proj2/screens/details_screen.dart';
import 'package:salma_proj2/screens/search_screen.dart';
import 'package:salma_proj2/services/api.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'package:salma_proj2/widgets/game_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Explore Games',
          style: GoogleFonts.audiowide(color: Colors.white, fontSize: 20),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),

     body: GameBackground(
     child: Stack(
     children: [
          FutureBuilder<List<GameModel>>(
            future: Api().getGames(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.flickr(
                    leftDotColor: Colors.red.shade700,
                    rightDotColor: Colors.green.shade700,
                    size: 30,
                  ),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Oops Something went wrong!',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              var games = snapshot.data!;

              return GridView.builder(
                padding: EdgeInsets.only(
                  top: 80,
                  bottom: 20,
                  left: 40,
                  right: 40,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.3,
                ),
                itemCount: games.length,
                itemBuilder: (context, index) {
                  var game = games[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(gameId: game),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.vertical(
                              top: Radius.circular(25),
                            ),
                            child: Image.network(
                              game.backgroundImage ?? 'assets/R.jpg',
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: MediaQuery.of(context).size.width * 0.42,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    game.name ?? 'Unknown Game',
                                    style: GoogleFonts.rajdhani(
                                      color: Color.fromARGB(255, 238, 244, 173),
                                      fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '${game.rating ?? 0}',
                                        style: GoogleFonts.rajdhani(
                                          color: Color.fromARGB(255,238,244,173),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.transparent,
                    child: BottomNavigationBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      currentIndex: 0,
                      onTap: (index) {
                        if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        }
                      },
                      selectedItemColor: Color.fromARGB(255, 238, 244, 173),
                      unselectedItemColor: Colors.white54,
                      type: BottomNavigationBarType.fixed,
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.search),
                          label: 'Search',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart),
                          label: 'Cart',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
     ),
    );
  }
}