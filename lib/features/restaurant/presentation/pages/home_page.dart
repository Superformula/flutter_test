import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/utils/app_keys.dart';
import 'package:restaurant_tour/di.dart';

import '../manager/home_cubit.dart';
import '../manager/home_state.dart';
import '../tabs/list_restaurants_widget.dart';

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
          bottom: TabBar(
            onTap: (_) {
              getIt.get<HomeCubit>().getRestaurants();
            },
            labelStyle: const TextStyle(
              color: Colors.black,
              fontFamily: 'Open-Sans',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            indicatorColor: Colors.black,
            tabs: const [
              Tab(
                text: "All Restaurants",
              ),
              Tab(
                text: "My Favorites",
              ),
            ],
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              context.watch<HomeCubit>().getRestaurants();
            } else if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  key: Key(AppKeys.loadingRestaurantsIndicator),
                  color: Colors.black,
                ),
              );
            } else if (state is HomeLoaded) {
              return TabBarView(
                children: [
                  Center(
                    child: state.restaurants.isNotEmpty
                        ? ListRestaurants(
                            restaurants: state.restaurants,
                          )
                        : const Text(
                            "Error when fetching restaurants",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Open-Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            key: Key(AppKeys.restaurantListIsEmpty),
                          ),
                  ),
                  Center(
                    child: state.favorites.isNotEmpty
                        ? ListRestaurants(
                            restaurants: state.favorites,
                          )
                        : const Text(
                            "Error when fetching favorites restaurants",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Open-Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                  ),
                ],
              );
            } else if (state is HomeError) {
              return const Center(
                child: Text(
                  "Error when try to get a restaurants list!",
                  key: Key(AppKeys.listRestaurantsError),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
