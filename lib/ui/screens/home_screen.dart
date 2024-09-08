import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/controllers/restaurant_view_controller.dart';
import 'package:restaurant_tour/typography.dart';

import 'restaurants_list_screen.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.viewController,
  });

  final RestaurantViewController viewController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final viewController = widget.viewController;

  @override
  void initState() {
    super.initState();

    viewController.getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 4,
          shadowColor: const Color(0xff000033),
          title: const Text(
            'RestauranTour',
            style: AppTextStyles.loraRegularHeadline,
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: DefaultTextStyle(
              style: AppTextStyles.openRegularTitleSemiBold,
              child: TabBar(
                labelPadding: EdgeInsets.all(8),
                tabAlignment: TabAlignment.center,
                dividerColor: Colors.transparent,
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Text('All Restaurants'),
                  Text('My Favorites'),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              BlocBuilder<RestaurantViewController, RestaurantViewModel>(
                bloc: viewController,
                builder: (context, state) {
                  
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: switch (state) {
                      RestaurantViewModelLoading() => const Center(child: CircularProgressIndicator()),
                      RestaurantViewModelData(restaurants: final restaurants) => RestaurantsList(restaurants: restaurants),
                      _ => const Center(child: Text('TODO')), // TODO: fix
                    },
                  );
                },
              ),
              const ColoredBox(color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
