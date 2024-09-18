import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/core/routes.dart';
import 'package:restaurant_tour/design_system/design_system.dart';
import 'package:restaurant_tour/modules/home/bloc/home_bloc.dart';
import 'package:restaurant_tour/modules/home/repository/home_repository.dart';
import 'package:restaurant_tour/modules/home/widgets/restaurant_list.dart';
import 'package:restaurant_tour/modules/restaurant_detail/models/detail_page_arguments.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        homeRepository: HomeRepository(),
      )..add(
          const LoadRestaurantsEvent(),
        ),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ErrorLoadRestaurantsState) {
          context.showDsSnackBar(
            message: 'Sorry! Error when load restaurants',
            type: SnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          initialIndex: state.model.initialIndex ?? 0,
          child: Scaffold(
            appBar: AppBar(
              title: const DsText(
                'Restaurant Tour',
                textVariant: TextVariant.title,
                isBold: true,
                fontFamily: AppFonts.secundary,
              ),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'All Restaurants'),
                  Tab(text: 'My Favorites'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                RestaurantList(
                  loading: state is LoadingRestaurantsState,
                  restaurants: state.model.restaurants ?? [],
                  onSelected: (restaurant) => _goDetail(
                    context,
                    restaurant: restaurant,
                    isFromFavorite: false,
                  ),
                ),
                RestaurantList(
                  loading: state is LoadingRestaurantsState,
                  restaurants: state.model.favoriteRestaurants ?? [],
                  onSelected: (restaurant) => _goDetail(
                    context,
                    restaurant: restaurant,
                    isFromFavorite: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _goDetail(
    BuildContext context, {
    required Restaurant restaurant,
    required bool isFromFavorite,
  }) {
    Navigator.of(context)
        .pushNamed(
      RoutePaths.restaurantDetail,
      arguments: DetailPageArgurments(
        restaurant: restaurant,
        isFromFavorite: isFromFavorite,
      ),
    )
        .then((value) {
      if (value == true) {
        context.read<HomeBloc>().add(
              LoadRestaurantsEvent(
                onlyFavorites: isFromFavorite,
              ),
            );
      }
    });
  }
}
