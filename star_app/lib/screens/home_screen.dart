import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/particles.dart';

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
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),
        child: const Column(
          children: [
            Text(
              "mkmkmkm",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
