import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prototype_constrained_box/prototype_constrained_box.dart';
import 'package:restaurant_tour/cubit.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/ui/colors.dart';
import 'package:restaurant_tour/ui/screens/list_restaurants_screen/state.dart';
import 'package:restaurant_tour/ui/screens/restaurant_details_screen/restaurant_details_screen.dart';
import 'package:restaurant_tour/ui/typography.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_hour_status.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_image.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_price_and_category_info.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_rating.dart';

import 'cubit.dart';

class ListRestaurantsScreen extends StatefulWidget {
  const ListRestaurantsScreen({
    super.key,
  });

  @override
  State<ListRestaurantsScreen> createState() => _ListRestaurantsScreenState();
}

class _ListRestaurantsScreenState extends State<ListRestaurantsScreen> {
  late final ListRestaurantsScreenCubit cubit;

  @override
  void initState() {
    super.initState();
    final repository = context.read<RestaurantsRepository>();

    cubit = ListRestaurantsScreenCubit(repository: repository);
    cubit.loadRestaurants();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListRestaurantsScreenCubit, ListRestaurantsScreenState>(
      bloc: cubit,
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('RestauranTour'),
              bottom: const TabBar(
                tabAlignment: TabAlignment.center,
                labelPadding: EdgeInsets.all(8.0),
                tabs: [
                  Text('All Restaurants'),
                  Text('My Favorites'),
                ],
              ),
            ),
            body: switch (state) {
              LoadingRestaurants() => _LoadingRestaurants(),
              RestaurantsData(:final restaurants) => _RestaurantsData(restaurants: restaurants),
              RestaurantsError(:final exception) => Text('Error: $exception'),
            },
          ),
        );
      },
    );
  }
}

final class _LoadingRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

final class _RestaurantsData extends StatelessWidget {
  const _RestaurantsData({
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantTourCubit, Set<String>>(
      builder: (context, state) {
        final filteredRestaurants = [
          for (final restaurant in restaurants)
            if (state.contains(restaurant.id)) restaurant,
        ];

        return TabBarView(
          children: [
            _RestaurantsList(restaurants: restaurants),
            _RestaurantsList(restaurants: filteredRestaurants),
          ],
        );
      },
    );
  }
}

final class _RestaurantsList extends StatelessWidget {
  const _RestaurantsList({
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    if (restaurants.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.heart_broken_rounded,
              color: Colors.emptyStateColor,
              size: 128.0,
            ),
            const SizedBox(height: 8.0),
            const Text(
              'You have no favorite restaurants.',
              style: AppTextStyles.loraHeading6,
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Go back to the restaurants list and add one to your favorites!',
              style: AppTextStyles.openCaption,
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                DefaultTabController.of(context).animateTo(0);
              },
              child: const Text('See all restaurants'),
            ),
          ],
        ),
      );
    } else {
      // The figma specifies 12.0, but there's already a perceived padding from
      // the card, so we compensate it.
      const verticalPadding = 4.0;

      return ListView.separated(
        padding: EdgeInsets.fromLTRB(
          12.0,
          verticalPadding * 2.0,
          12.0,
          verticalPadding * 2.0 + MediaQuery.of(context).padding.bottom,
        ),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return _RestaurantCard(restaurant: restaurants[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(height: verticalPadding),
      );
    }
  }
}

final class _RestaurantCard extends StatelessWidget {
  const _RestaurantCard({
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RestaurantDetailsScreen(
                restaurant: restaurant,
                onFavorite: () => context.read<RestaurantTourCubit>().toggleFavorite(restaurant.id),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox.square(
                dimension: 88.0,
                child: RestaurantImage(
                  heroTag: restaurant.id,
                  restaurant: restaurant,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PrototypeConstrainedBox.tightFor(
                      height: true,
                      prototype: const Text(
                        'First line\nSecond line',
                        style: AppTextStyles.loraSubtitle1,
                      ),
                      child: Text(
                        restaurant.name,
                        style: AppTextStyles.loraSubtitle1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    RestaurantPriceAndCategoryInfo(restaurant: restaurant),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        RestaurantRating(restaurant: restaurant),
                        const Spacer(),
                        RestaurantHourStatus(restaurant: restaurant),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
