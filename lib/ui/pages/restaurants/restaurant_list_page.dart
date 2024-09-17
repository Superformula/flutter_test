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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);
      _restaurantProvider.getRestaurants();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
          !_restaurantProvider.isLoading &&
          _restaurantProvider.hasMore) {
        _restaurantProvider.loadMoreRestaurants();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// The Pull refresh function
  Future<void> _onRefresh() async {
    await _restaurantProvider.getRestaurants(offset: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OsColors.bgColor,
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Consumer<RestaurantProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading && provider.restaurants == null) {
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
                controller: _scrollController,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  const SliverPadding(padding: EdgeInsets.only(top: 10.0)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == restaurants.length) {
                          return provider.isLoading
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: OsColors.secondaryColor,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink();
                        }

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
                      childCount: restaurants.length + 1,
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
