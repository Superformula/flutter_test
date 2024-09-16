import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';

/// Widget to load imageUrl with Hero effect and cacheNetworkImage
class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final String id;
  final double? height;
  final double? withd;
  final bool? rounded;

  const ImageWidget({
    super.key,
    required this.imageUrl,
    required this.id,
    this.height,
    this.withd,
    this.rounded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(rounded! ? 8.0 : 1.0),
      child: Hero(
        tag: id,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: withd,
          height: height,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(
            strokeWidth: 2,
            color: OsColors.secondaryColor,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
