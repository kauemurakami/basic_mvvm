import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_icons.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //TODO : implement add to favorites
      },
      icon: const Icon(
        AppIcons.favoriteOutline,
        // color: Colors.red,
        size: 20,
      ),
    );
  }
}
