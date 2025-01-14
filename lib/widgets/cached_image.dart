import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/constants/app_constants.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    super.key,
    this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    this.imageFit,
  });
  final String? imageUrl;
  final double? imageHeight;
  final double? imageWidth;
  final BoxFit? imageFit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
      height: imageHeight ?? size.width * 0.3,
      width: imageWidth ?? size.width * 0.2,
      imageUrl: imageUrl ?? AppConstants.cImageUrl,
      fit: imageFit ?? BoxFit.cover,
    );
  }
}
