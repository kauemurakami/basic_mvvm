import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_constants.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        AppConstants.cGenres.length,
        (index) => chipWidget(genreName: AppConstants.cGenres[index], context: context),
      ),
    );
  }

  Widget chipWidget({required String genreName, required BuildContext context}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Theme.of(context).colorScheme.surface.withOpacity(.2),
            border: Border.all(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0,
            ),
            child: Text(
              genreName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      );
}
