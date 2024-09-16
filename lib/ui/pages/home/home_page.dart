import 'package:flutter/material.dart';
import 'package:restaurant_tour/ui/pages/home/widgets/app_bar.dart';
import 'package:restaurant_tour/ui/pages/restaurants/restaurant_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        tabController: _tabController,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const RestaurantListPage(),
          _buildFavoritesTab(),
        ],
      ),
    );
  }

  Widget _buildFavoritesTab() {
    return Center(
      child: Text("My Favorites"),
    );
  }
}
