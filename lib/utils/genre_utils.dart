import 'package:flutter_mvvm/models/movie_genres_model.dart';
import 'package:flutter_mvvm/repository/movies_repository.dart';
import 'package:flutter_mvvm/service/init_get.dart';

class GenreUtils {
  static List<MovieGenreModel> movieGenrerNames(List<int> genrerIds) {
    final MoviesRepository moviesRepository = getIt<MoviesRepository>();
    final cachedGenres = moviesRepository.cachedGenres;
    List<MovieGenreModel> genresNames = [];
    for (var genreId in genrerIds) {
      var genre = cachedGenres.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MovieGenreModel(id: 123321, name: 'Unknow'),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
