import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_icons.dart';
import 'package:flutter_mvvm/widgets/movies/movie_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        actions: [
          IconButton(
            onPressed: () {
              //TODO: remove favorites
            },
            icon: const Icon(
              AppIcons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const MoviesWidget(),
      ),
    );
  }
}
