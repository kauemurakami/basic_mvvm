import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_icons.dart';
import 'package:flutter_mvvm/models/movies_model.dart';
import 'package:flutter_mvvm/screens/movie_details.dart';
import 'package:flutter_mvvm/service/init_get.dart';
import 'package:flutter_mvvm/service/navigation.dart';
import 'package:flutter_mvvm/widgets/movies/favorite_button.dart';
import 'package:flutter_mvvm/widgets/movies/genres_list_widget.dart';

import '../cached_image.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            getIt<NavigationService>().navigate(MoveDetailsScreen(movie: movie));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: movie.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedImageWidget(
                        imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.originalTitle,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text("${movie.voteAverage}/10"),
                          ],
                        ),
                        const SizedBox(height: 10),
                        GenresListWidget(
                          movie: movie,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              AppIcons.watchLaterOutlined,
                              size: 20,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              movie.releaseDate.toIso8601String(),
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            const FavoriteButtonWidget()
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
