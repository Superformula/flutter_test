import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/utils/typography.dart';

import '../../cubit/favorite/favorite.dart';
import '../../cubit/restaurants/restaurants.dart';
import 'widgets/favorites_tab_widget.dart';
import 'widgets/restaurants_tab_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  RestaurantsCubit get cubit => context.read<RestaurantsCubit>();
  FavoriteCubit get favoriteCubit => context.read<FavoriteCubit>();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    cubit.fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'RestauranTour',
            style: AppTextStyles.loraRegularHeadline,
          ),
          bottom: TabBar(
            controller: tabController,
            tabs: const <Widget>[
              Tab(
                child: Text(
                  'All Restaurants',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.openRegularTitleSemiBold,
                ),
              ),
              Tab(
                child: Text(
                  'Favorite Restaurants',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.openRegularTitleSemiBold,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: tabController,
            children: const [
              RestaurantsTabWidget(),
              FavoritesTabWidget(),
            ],
          ),
        ),
      );
}
