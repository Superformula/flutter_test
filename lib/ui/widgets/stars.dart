import 'package:flutter/widgets.dart';

import 'widgets.dart';

class Stars extends StatelessWidget {
  final int _quantity;

  const Stars(this._quantity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < _quantity; i++) const StarIcon(),
      ],
    );
  }
}
