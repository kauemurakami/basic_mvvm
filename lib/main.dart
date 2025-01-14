import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_theme_data.dart';
import 'package:flutter_mvvm/screens/favorites.dart';
import 'package:flutter_mvvm/screens/movie_details.dart';
import 'package:flutter_mvvm/screens/movies.dart';
import 'package:flutter_mvvm/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: AppThemeData.lightTheme,
      // home: const SplashScreen(),
      // home: const FavoritesScreen(),
      home: const MoviesScreen(),
      // home: MoveDetailsScreen(),
    );
  }
}
