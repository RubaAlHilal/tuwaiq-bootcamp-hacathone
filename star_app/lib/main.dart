import 'package:flutter/material.dart';
import 'package:star_app/components/nav_bar.dart';
import 'package:star_app/networking/supabase_networking/supabase_config.dart';

void main() {
  supabaseConfig();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const NavigationScreen(),
    );
  }
}
