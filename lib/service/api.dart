import 'dart:convert';
import 'dart:developer';

import 'package:flutter_mvvm/constants/api_constants.dart';
import 'package:flutter_mvvm/models/movie_genres_model.dart';
import 'package:flutter_mvvm/models/movies_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/movie/popular?language=en-US&page=1');
    final response = await http.get(
      url,
      headers: ApiConstants.headers,
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      log('data $data');
      return List<MovieModel>.from(data['results'].map((element) => MovieModel.fromJson(element)));
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }

  Future<List<MovieGenreModel>> fetchGenres() async {
    final url = Uri.parse('${ApiConstants.baseUrl}/genre/movie/list?language=en');
    final response = await http.get(
      url,
      headers: ApiConstants.headers,
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      log('data $data');
      return List<MovieGenreModel>.from(data['genres'].map((element) => MovieGenreModel.fromJson(element)));
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }
}
