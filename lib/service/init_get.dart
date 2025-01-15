import 'package:flutter_mvvm/repository/movies_repository.dart';
import 'package:flutter_mvvm/service/api.dart';
import 'package:flutter_mvvm/service/navigation.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepository(getIt<ApiService>()));
}
