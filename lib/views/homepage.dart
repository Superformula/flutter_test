import 'package:flutter/material.dart';
import 'package:restaurant_tour/views/favorites_view.dart';
import 'package:restaurant_tour/views/splitview.dart';
import 'package:restaurant_tour/views/yelp_listview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Restaurant Tour'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'All Restaurants'),
              Tab(text: 'My Favorites'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAllRestaurantsTab(),
            SplitView(listView: FavoritesView()),
          ],
        ),
      ),
    );
  }

  Widget _buildAllRestaurantsTab() {
    return SplitView(listView: YelpListView());
  }
}
