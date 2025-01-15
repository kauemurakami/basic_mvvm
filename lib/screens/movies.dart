import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_icons.dart';
import 'package:flutter_mvvm/models/movie_genres_model.dart';
import 'package:flutter_mvvm/models/movies_model.dart';
import 'package:flutter_mvvm/repository/movies_repository.dart';
import 'package:flutter_mvvm/screens/favorites.dart';
import 'package:flutter_mvvm/service/api.dart';
import 'package:flutter_mvvm/service/init_get.dart';
import 'package:flutter_mvvm/service/navigation.dart';
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
            onPressed: () async {
              // await getIt<NavigationService>().showDialog(Text('aaa'));
              // getIt<NavigationService>().showSnackbar();
              await getIt<NavigationService>().navigate(const FavoritesScreen());
            },
            icon: const Icon(
              AppIcons.favoriteRounded,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () async {
              final List<MovieGenreModel> moviesGenres = await getIt<MoviesRepository>().fetchGenres();
              final List<MovieModel> movies = await getIt<MoviesRepository>().fetchMovies();
              print(movies.length);
              print(moviesGenres.length);
            },
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
