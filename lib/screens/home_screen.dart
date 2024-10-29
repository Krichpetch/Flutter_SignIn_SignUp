import 'package:flutter/material.dart';
import '../constants/constant.dart';
import '../components/home_screen_button.dart';

import '../screens/blank_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: themeSecondary,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text("STARGAZERS",
                style: textTitlePrimary.copyWith(
                    fontSize: 28, color: highlightPrimary)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: highlightTertiary),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: highlightTertiary),
            onPressed: () {},
          ),
          ClipOval(
            child: Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/Suisei.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/space.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      "FIND YOUR FATE \nIN THE STARS",
                      style: textTitleSecondary,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themePrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BlankScreen()),
                        );
                      },
                      child: Text("Explore", style: textButtonTertiary),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
            child: Text(
              "Explore Space",
              style: textTitleTertiary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HomeScreenButtonBig(
                      label: "Planets",
                      backgroundImage: 'assets/images/Planet.png',
                    ),
                    HomeScreenButtonSmall(
                      icon: Icons.shop_2_sharp,
                      label: "Shop",
                      bgColor: highlightPrimary,
                      iconColor: themeSecondary,
                      textStyle: textTitleTertiary,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HomeScreenButtonBig(
                      label: "Constellations",
                      backgroundImage: 'assets/images/Constellations.jpg',
                    ),
                    HomeScreenButtonSmall(
                      icon: Icons.image_search_sharp,
                      label: "Gallery",
                      bgColor: themeSecondary,
                      iconColor: highlightSecondary,
                      textStyle: textTitlePrimary,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HomeScreenButtonBig(
                      label: "Galaxy",
                      backgroundImage: 'assets/images/Milkyway.png',
                    ),
                    HomeScreenButtonSmall(
                      icon: Icons.more_vert,
                      label: "More",
                      bgColor: highlightPrimary,
                      iconColor: themeSecondary,
                      textStyle: textTitleTertiary,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
