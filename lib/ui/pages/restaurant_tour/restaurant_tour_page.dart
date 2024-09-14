import 'package:flutter/material.dart';

import '../../../typography.dart';

part 'widgets/app_bar.dart';

class RestaurantTourPage extends StatelessWidget {
  const RestaurantTourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _AppBar(),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Center(child: Text('All Restaurants Content')),
            Center(child: Text('My Favorites Content')),
          ],
        ),
      ),
    );
  }
}
