import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/particles.dart';
import 'package:star_app/screens/favourite_screen.dart';

import '../animation/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/stars-galaxy.gif"),
        )),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Favourite Planets",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: SizedBox(
                      height: 120,
                      child: FavouriteCard(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
