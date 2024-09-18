import 'package:flutter/material.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget(
      {required this.callback, required this.isFavorite, super.key});
  final Function(bool) callback;
  final bool? isFavorite;

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  bool isFavoriteState = false;
  @override
  void initState() {
    isFavoriteState = widget.isFavorite ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavoriteState = !isFavoriteState;
          });
          widget.callback(isFavoriteState);
        },
        icon: (isFavoriteState)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_outline));
  }
}
