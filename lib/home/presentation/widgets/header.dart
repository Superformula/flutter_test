import 'package:flutter/material.dart';
import 'package:restaurant_tour/themes/typography.dart';

import '../../services/module_communication.dart';
import '../../services/module_communication_interface.dart';
import '../../utils/utils.dart';

class HeaderHome extends StatefulWidget {
  final String text;
  final bool isDetailsPage;
  final String? restaurantId;
  const HeaderHome({
    required this.text,
    this.isDetailsPage = false,
    this.restaurantId,
    super.key,
  });

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  ModuleCommunicationInterface communication =
      ModuleCommunication.getInstance();
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checIconFavority();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.text, style: AppTextStyles.loraRegularHeadline),
            ],
          ),
        ),
        if (widget.isDetailsPage) ...[
          IconButton(
            icon: isFavorite
                ? const Icon(
                    Icons.favorite,
                  )
                : const Icon(
                    Icons.favorite_border,
                  ),
            onPressed: () {
              setState(() {
                if (!isFavorite) {
                  Utils.addFavorityRestaurant(
                    communication,
                    widget.restaurantId!,
                  );
                } else {
                  Utils.removeFavorityRestaurant(
                    communication,
                    widget.restaurantId!,
                  );
                }
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ],
    );
  }

  Future<void> checIconFavority() async {
    isFavorite = await Utils.findFavorityRestaurant(
      communication,
      widget.restaurantId!,
    );
    setState(() {
      isFavorite = isFavorite;
    });
  }
}
