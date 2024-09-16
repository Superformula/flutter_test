import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/config/providers/restaurant_providers.dart';
import 'package:restaurant_tour/ui/pages/home/widgets/card_item.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';
import 'package:restaurant_tour/ui/ui.dart';

/// The restaurant list
class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  late RestaurantProvider _restaurantProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);
      _restaurantProvider.getRestaurants();
    });
  }

  /// The Pull refresh function
  Future<void> _onRefresh() async {
    await _restaurantProvider.getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OsColors.bgColor,
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Consumer<RestaurantProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: OsColors.secondaryColor,
                ),
              );
            } else if (provider.errorMessage != null) {
              return Center(child: Text('${AppConstants.error}: ${provider.errorMessage}'));
            } else if (provider.restaurants == null || provider.restaurants!.isEmpty) {
              return const Center(child: Text(AppConstants.noRestaurantsAvailable));
            } else {
              final restaurants = provider.restaurants!;
              return CustomScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  const SliverPadding(padding: EdgeInsets.only(top: 10.0)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final restaurant = restaurants[index];
                        bool isOpenNow = false;
                        if (restaurant.hours.isNotEmpty) {
                          isOpenNow = restaurant.hours.first.isOpenNow;
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          child: CardItem(
                            restaurant: restaurant,
                            isRestaurantOpen: isOpenNow,
                          ),
                        );
                      },
                      childCount: restaurants.length,
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 16.0)),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
