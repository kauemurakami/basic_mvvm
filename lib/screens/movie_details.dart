import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_icons.dart';
import 'package:flutter_mvvm/models/movies_model.dart';
import 'package:flutter_mvvm/widgets/cached_image.dart';
import 'package:flutter_mvvm/widgets/movies/favorite_button.dart';
import 'package:flutter_mvvm/widgets/movies/genres_list_widget.dart';

class MoveDetailsScreen extends StatelessWidget {
  const MoveDetailsScreen({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: movie.id,
              child: SizedBox(
                height: size.height * .45,
                width: double.infinity,
                child: CachedImageWidget(
                  imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .4,
                    child: Container(),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 25.0,
                                ),
                                Text(
                                  movie.originalTitle,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      AppIcons.star,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text('${movie.voteAverage.toStringAsFixed(1)}/10'),
                                    const Spacer(),
                                    Text(
                                      movie.releaseDate.toIso8601String(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                GenresListWidget(
                                  movie: movie,
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  movie.overview,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FavoriteButtonWidget(
                              movie: movie,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const BackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
