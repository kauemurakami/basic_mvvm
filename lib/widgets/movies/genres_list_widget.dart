import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/movie_genres_model.dart';
import 'package:flutter_mvvm/models/movies_model.dart';
import 'package:flutter_mvvm/utils/genre_utils.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    List<MovieGenreModel> moviesGenres = GenreUtils.movieGenrerNames(movie.genreIds);

    return Wrap(
      children: List.generate(
        moviesGenres.length,
        (index) => chipWidget(genreName: moviesGenres[index].name, context: context),
      ),
    );
  }

  Widget chipWidget({required String genreName, required BuildContext context}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Theme.of(context).colorScheme.surface.withOpacity(.2),
            border: Border.all(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0,
            ),
            child: Text(
              genreName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      );
}
