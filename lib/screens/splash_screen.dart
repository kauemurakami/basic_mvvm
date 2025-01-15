import 'package:flutter/material.dart';
import 'package:flutter_mvvm/repository/movies_repository.dart';
import 'package:flutter_mvvm/screens/movies.dart';
import 'package:flutter_mvvm/service/init_get.dart';
import 'package:flutter_mvvm/service/navigation.dart';
import 'package:flutter_mvvm/widgets/error_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  String _errorMessage = '';
  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();

  @override
  initState() {
    super.initState();
    _loaData();
  }

  Future<void> _loaData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      await _moviesRepository.fetchGenres();
      await getIt<NavigationService>().navigateReplace(const MoviesScreen());
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Loading...'),
                SizedBox(
                  height: 20.0,
                ),
                CircularProgressIndicator.adaptive(),
              ],
            ))
          : MyErrorWidget(
              errorMessage: _errorMessage,
              retryFunction: () async {
                await _loaData();
              }),
    );
  }
}
