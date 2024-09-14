part of '../restaurant_detail_page.dart';

class _FavoriteIcon extends StatelessWidget {
  final VoidCallback _onFavorite;

  const _FavoriteIcon({
    required VoidCallback onFavorite,
  }) : _onFavorite = onFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onDoubleTap: _onFavorite,
        child: const Icon(Icons.favorite_border),
      ),
    );
  }
}
