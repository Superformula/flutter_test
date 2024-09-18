import 'package:flutter/material.dart';

class RestaurantHeroWidget extends StatelessWidget {
  const RestaurantHeroWidget({
    required this.imageUrl,
    required this.tag,
    super.key,
  });
  final String? tag;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? 'restaurant_id',
      child: Image.network(
        errorBuilder: (context, error, stackTrace) =>
            const Center(child: Icon(Icons.error)),
        imageUrl ?? 'https://picsum.photos/375/361',
        height: 361,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
    );
  }
}
