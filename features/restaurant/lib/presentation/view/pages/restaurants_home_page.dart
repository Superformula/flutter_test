import 'package:flutter/material.dart';
import 'package:restaurant/presentation/view/widgets/tabs/all_restaurants_tab.dart';

class RestaurantsHomePage extends StatefulWidget {
  const RestaurantsHomePage({super.key});

  @override
  State<RestaurantsHomePage> createState() => _RestaurantsHomePageState();
}

class _RestaurantsHomePageState extends State<RestaurantsHomePage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(80.0), // Altura total da AppBar
            child: Column(
              children: <Widget>[
                Text('RestaurantTour',
                    style: Theme.of(context).textTheme.headlineMedium),
                TabBar(
                  controller: tabController,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  labelStyle: Theme.of(context).textTheme.headlineSmall,
                  tabs: const [
                    Tab(
                      text: "All Restaurants",
                    ),
                    Tab(
                      text: "My Favorite",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            AllRestaurantsTab(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Favorites"),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
