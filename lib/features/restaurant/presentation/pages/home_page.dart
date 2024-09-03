import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/restaurant/presentation/widgets/list_restaurants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'RestauranTour',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lora',
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          bottom: const TabBar(
            labelStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Open-Sans',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                text: "All Restaurants",
              ),
              Tab(
                text: "My Favorites",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ListRestaurants(),
            ),
            Center(
              child: Text("Teste 2"),
            ),
          ],
        ),
      ),
    );
  }
}
