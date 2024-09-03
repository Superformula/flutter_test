import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/aplication/yelp/yelp_bloc.dart';
import 'package:restaurant_tour/injection.dart';
import 'package:restaurant_tour/presentation/core/styles/text_styles.dart';
import 'package:restaurant_tour/presentation/pages/home/widgets/all_restaunrants_widget.dart';
import 'package:restaurant_tour/presentation/pages/home/widgets/favorite_restaurants_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<YelpBloc>(
          create: (BuildContext context) => getIt<YelpBloc>()
            ..add(const YelpEvent.getRestaurantsData())
            ..add(const YelpEvent.loadFavoriteRestaurants()),
        ),
      ],
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'RestauranTour',
              style: TextStyles.scaffoldTitleTextStyle,
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'All Restaurants'),
                Tab(text: 'My Favorites'),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          body: const TabBarView(
            children: [
              AllRestaurantsWidget(),
              FavoriteRestaurantsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
