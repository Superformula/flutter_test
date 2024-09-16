import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/constants.dart';


class MyFavoritesTab extends StatelessWidget {
  const MyFavoritesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: kPaddingTopTabBar),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('My Favorites'),
          ],
        ),
      ),
    );
  }
}