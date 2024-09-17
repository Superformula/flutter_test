part of '../restaurant_detail_page.dart';

class _FavoriteIcon extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback _onFavorite;

  const _FavoriteIcon({
    this.isFavorite = false,
    required VoidCallback onFavorite,
  }) : _onFavorite = onFavorite;

  @override
  State<_FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<_FavoriteIcon> {
  late bool _isFavorite;

  @override
  void initState() {
    _isFavorite = widget.isFavorite;
    super.initState();
  }

  void _onTap() {
    widget._onFavorite();
    _isFavorite = !_isFavorite;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: _onTap,
        child: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
