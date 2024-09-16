import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';

/// Widget to load imageUrl with cacheNetworkImage
class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 88,
        height: 88,
        fit: BoxFit.cover,
        placeholder: (context, url) => const CircularProgressIndicator(
          strokeWidth: 2,
          color: OsColors.secondaryColor,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
