import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const CityBikeApp());
}

class CityBikeApp extends StatelessWidget {
  const CityBikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Bike Networks',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
