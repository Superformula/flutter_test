import 'package:flutter/material.dart';

import '../../../../models/restaurant.dart' as model;
import '../../../../typography.dart';

class RestaurantListCategoriesWidget extends StatelessWidget {
  final List<model.Category> categories;

  RestaurantListCategoriesWidget({super.key, required this.categories});
  String response = '';

  @override
  Widget build(BuildContext context) {
    if (categories == null) {
      return const Text('');
    }
    for (int i = 0; i < categories.length; i++) {
      response += '${categories[i].alias!} ';
    }
    return Text(
      response,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.openRegularText,
    );
  }
}
