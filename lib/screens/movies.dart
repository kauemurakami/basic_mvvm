import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_icons.dart';
import 'package:flutter_mvvm/screens/favorites.dart';
import 'package:flutter_mvvm/service/init_get.dart';
import 'package:flutter_mvvm/service/navigation.dart';
import 'package:flutter_mvvm/widgets/cached_image.dart';
import 'package:flutter_mvvm/widgets/movies/movie_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigate(const FavoritesScreen());
            },
            icon: const Icon(
              AppIcons.favoriteRounded,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              AppIcons.darkMode,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const MoviesWidget(),
      ),
    );
  }
}
