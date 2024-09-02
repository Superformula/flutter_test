import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/aplication/yelp/yelp_bloc.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/presentation/pages/home/widgets/review_card_widget.dart';

@RoutePage()
class RestaurantDetailsPage extends StatelessWidget {
  final Restaurant restaurant;
  final YelpBloc yelpBloc;

  const RestaurantDetailsPage(
      {super.key, required this.restaurant, required this.yelpBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: this.yelpBloc,
      child: BlocBuilder<YelpBloc, YelpState>(
        builder: (context, state) {
          final isFavorite =
              state.favoriteRestaurants.any((fav) => fav.id == restaurant.id);

          void toggleFavorite() {
            if (isFavorite) {
              yelpBloc
                  .add(YelpEvent.removeFavoriteRestaurant(restaurant.id ?? ""));
            } else {
              yelpBloc.add(YelpEvent.addFavoriteRestaurant(restaurant));
            }
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(restaurant.name ?? ""),
              actions: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.black,
                  ),
                  onPressed: toggleFavorite,
                ),
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: restaurant.heroImage.isNotEmpty
                      ? Image.network(
                          restaurant.heroImage,
                          height: 372,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: 372,
                          color: Colors.grey[200],
                        ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(24.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          children: [
                            Text(
                                "${restaurant.price ?? ''} ${restaurant.displayCategory}"),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  restaurant.isOpen ? 'Open now' : 'Closed',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: restaurant.isOpen
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.circle,
                                  color: restaurant.isOpen
                                      ? Colors.green
                                      : Colors.red,
                                  size: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(height: 48),
                        const Text("Address"),
                        const SizedBox(height: 24),
                        Text(restaurant.location?.formattedAddress ?? ""),
                        const Divider(height: 48),
                        const Text("Overall Rating"),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Text(
                              "${restaurant.rating}",
                              style: const TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w700),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 50.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final review = restaurant.reviews?[index];
                        return ReviewCardWidget(
                          userName: review!.user?.name ?? "",
                          imageUrl: review.user?.imageUrl ?? "",
                          rating: review.rating ?? 0,
                          reviewText: review.text ?? "",
                        );
                      },
                      childCount: restaurant.reviews?.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
