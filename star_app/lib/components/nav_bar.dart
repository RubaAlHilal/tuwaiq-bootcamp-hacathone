import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:star_app/screens/chat_screen.dart';
import 'package:star_app/screens/favourite_screen.dart';
import 'package:star_app/screens/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

int _currentIndex = 0;

class _NavigationScreenState extends State<NavigationScreen> {
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final pages = [
    const ChatScreen(),
    const HomeScreen(),
    const FavouriteScrren(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: DotNavigationBar(
        enableFloatingNavBar: true,
        itemPadding:
            const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        marginR: const EdgeInsets.symmetric(horizontal: 120, vertical: 2),
        curve: Curves.fastLinearToSlowEaseIn,
        backgroundColor: const Color.fromARGB(255, 6, 10, 56),
        currentIndex: _currentIndex,
        onTap: changePage,
        dotIndicatorColor: Colors.white,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey.shade500,
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.chat),
          ),
          DotNavigationBarItem(
            icon: const ImageIcon(AssetImage("assets/globe.png")),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.star_rounded),
          ),
        ],
      ),
    );
  }
}
