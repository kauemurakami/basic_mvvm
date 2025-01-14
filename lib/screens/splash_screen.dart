import 'package:flutter/material.dart';
import 'package:flutter_mvvm/widgets/error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyErrorWidget(errorMessage: 'error text', retryFunction: () {}),
    );
  }
}
