import 'package:flutter_mvvm/models/movie_genres_model.dart';
import 'package:flutter_mvvm/models/movies_model.dart';
import 'package:flutter_mvvm/service/api.dart';

class MoviesRepository {
  final ApiService _apiService;
  MoviesRepository(this._apiService);
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    return await _apiService.fetchMovies(page: page);
  }

  List<MovieGenreModel> cachedGenres = [];
  Future<List<MovieGenreModel>> fetchGenres() async {
    return cachedGenres = await _apiService.fetchGenres();
  }
}
