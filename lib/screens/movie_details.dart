import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_constants.dart';
import 'package:flutter_mvvm/constants/app_icons.dart';
import 'package:flutter_mvvm/widgets/cached_image.dart';
import 'package:flutter_mvvm/widgets/movies/favorite_button.dart';
import 'package:flutter_mvvm/widgets/movies/genres_list_widget.dart';

class MoveDetailsScreen extends StatelessWidget {
  const MoveDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height * .45,
              width: double.infinity,
              child: const CachedImageWidget(
                imageUrl: AppConstants.cImageUrl,
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
                                const Text(
                                  'Movie Title',
                                  maxLines: 2,
                                  style: TextStyle(
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
                                const Row(
                                  children: [
                                    Icon(
                                      AppIcons.star,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text('9/10'),
                                    Spacer(),
                                    Text(
                                      'Release Date',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const GenresListWidget(),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'overview' * 200,
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
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: FavoriteButtonWidget(),
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
