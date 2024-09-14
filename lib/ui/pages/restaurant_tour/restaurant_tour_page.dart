import 'package:flutter/material.dart';

import '../../../typography.dart';
import '../../widgets/widgets.dart';

part 'widgets/app_bar.dart';
part 'widgets/image.dart';
part 'widgets/restaurant_item.dart';

class RestaurantTourPage extends StatelessWidget {
  const RestaurantTourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const _AppBar(),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                _RestaurantItem(),
              ],
            ),
            const Center(child: Text('My Favorites Content')),
          ],
        ),
      ),
    );
  }
}
