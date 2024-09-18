import 'package:flutter/material.dart';

import 'package:restaurant_tour/design_system/design_system.dart';
import 'package:restaurant_tour/modules/home/widgets/restaurant_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const DsText(
            'Restaurant Tour',
            textVariant: TextVariant.title,
            isBold: true,
            fontFamily: AppFonts.secundary,
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All Restaurants'),
              Tab(text: 'My Favorites'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RestaurantList(),
            Center(
              child: Text('Tab 2'),
            ),
          ],
        ),
      ),
    );
  }
}
