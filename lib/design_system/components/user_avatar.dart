import 'package:flutter/material.dart';

import 'package:restaurant_tour/design_system/atoms/atoms.dart';
import 'package:restaurant_tour/design_system/tokens/tokens.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.name,
    this.urlImage,
  });

  final String name;
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: urlImage != null
              ? ClipOval(
                  child: DsImageNetwork(
                    urlImage: urlImage,
                  ),
                )
              : const Icon(Icons.person),
        ),
        const SizedBox(width: DsSizes.xxs),
        DsText(name),
      ],
    );
  }
}
