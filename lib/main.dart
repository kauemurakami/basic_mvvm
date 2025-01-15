import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mvvm/constants/app_theme_data.dart';
import 'package:flutter_mvvm/screens/movies.dart';
import 'package:flutter_mvvm/screens/splash_screen.dart';
import 'package:flutter_mvvm/service/init_get.dart';
import 'package:flutter_mvvm/service/navigation.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) async {
      await dotenv.load(fileName: "assets/.env").catchError(
        (error) {
          print('load env error: ${error.toString()}');
        },
      ).whenComplete(
        () => print('.env initialized'),
      );
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: AppThemeData.lightTheme,
      home: const SplashScreen(),
    );
  }
}
