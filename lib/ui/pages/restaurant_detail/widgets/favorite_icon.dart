part of '../restaurant_detail_page.dart';

class _FavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback _onFavorite;

  const _FavoriteIcon({
    this.isFavorite = false,
    required VoidCallback onFavorite,
  }) : _onFavorite = onFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onDoubleTap: _onFavorite,
        child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
