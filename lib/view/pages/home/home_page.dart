import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/typography.dart';
import 'package:restaurant_tour/view/pages/favorites/favorites_page.dart';

import '../../cubit/favorite/favorite.dart';
import '../../cubit/restaurants/restaurants.dart';
import '../restaurant/restaurant_page.dart';
import '../../widgets/restaurant_card_widget.dart';

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
            children: [
              BlocBuilder<RestaurantsCubit, RestaurantsState>(
                builder: (context, state) {
                  switch (state.status) {
                    case RestaurantsStatus.initial:
                      return const SizedBox.shrink(
                        key: Key('initial state'),
                      );
                    case RestaurantsStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case RestaurantsStatus.success:
                      return Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ListView.builder(
                          itemCount: state.restaurants.length,
                          itemBuilder: (context, index) {
                            final restaurant =
                                state.restaurants.elementAt(index);

                            return RestaurantCardWidget(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (context) => BlocProvider.value(
                                    value: favoriteCubit,
                                    child: RestaurantPage(
                                      restaurant: restaurant,
                                    ),
                                  ),
                                ),
                              ),
                              restaurant: state.restaurants[index],
                            );
                          },
                        ),
                      );

                    case RestaurantsStatus.failure:
                      return Center(
                        child: Text(state.errorMessage),
                      );
                  }
                },
              ),
              BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  switch (state.status) {
                    case FavoriteStatus.initial:
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inbox,
                            size: 48,
                          ),
                          Text(
                            'You have not added any favorite resaturants!',
                          ),
                        ],
                      );
                    case FavoriteStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case FavoriteStatus.success:
                      return FavoritesListBuilder(
                        restaurants: state.favorites,
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      );
}
