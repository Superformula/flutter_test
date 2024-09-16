import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/constants.dart';
import 'package:restaurant_tour/shared/rt_skeleton.dart';

class AllRestaurantsTab extends StatelessWidget {
  const AllRestaurantsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: kPaddingTopTabBar),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RtSkeleton(
              width: 50,
              height: 100,
            ),
            Text('All Restaurants')
          ],
        ),
      ),
    );
  }
}
