import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_icons.dart';
import 'package:flutter_mvvm/models/movies_model.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget({super.key, required this.movie});
  final MovieModel movie;

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  final favoriteMovieIds = [];
  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteMovieIds.contains(widget.movie.id);
    return IconButton(
      onPressed: () {
        if (isFavorite) {
          favoriteMovieIds.remove(widget.movie.id);
        } else {
          favoriteMovieIds.add(widget.movie.id);
        }
        setState(() {});
      },
      icon: Icon(
        isFavorite ? AppIcons.favorite : AppIcons.favoriteOutline,
        color: isFavorite ? Colors.red : null,
        size: 20,
      ),
    );
  }
}
