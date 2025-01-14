import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_icons.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key, required this.errorMessage, required this.retryFunction});
  final String errorMessage;
  final Function retryFunction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            AppIcons.error,
            color: Colors.red,
            size: 50.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Error $errorMessage',
            style: const TextStyle(fontSize: 16.0, color: Colors.red),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              retryFunction();
            },
            child: const Text(
              'Retry',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
