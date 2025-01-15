import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_icons.dart';
import 'package:flutter_mvvm/models/movies_model.dart';
import 'package:flutter_mvvm/repository/movies_repository.dart';
import 'package:flutter_mvvm/screens/favorites.dart';
import 'package:flutter_mvvm/service/init_get.dart';
import 'package:flutter_mvvm/service/navigation.dart';
import 'package:flutter_mvvm/widgets/movies/movie_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MovieModel> _movies = [];
  int _currentPage = 1;
  bool _isFetching = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isFetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) {
      return;
    }
    setState(() {
      _isFetching = true;
    });
    try {
      final List<MovieModel> movies = await getIt<MoviesRepository>().fetchMovies(page: _currentPage);
      setState(() {
        _movies.addAll(movies);
        _currentPage++;
      });
    } catch (e) {
      getIt<NavigationService>().showSnackbar('An error occurred $e');
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

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
              // final List<MovieGenreModel> moviesGenres = await getIt<MoviesRepository>().fetchGenres();
              // final List<MovieModel> movies = await getIt<MoviesRepository>().fetchMovies();
              // print(movies.length);
              // print(moviesGenres.length);
            },
            icon: const Icon(
              AppIcons.darkMode,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _movies.length + (_isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _movies.length) {
            return MoviesWidget(
              movie: _movies[index],
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
