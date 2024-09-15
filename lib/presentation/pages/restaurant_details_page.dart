import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/dependency_injection.dart';
import 'package:restaurant_tour/core/utils/typography.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/presentation/controllers/favorites/favorites_cubit.dart';
import 'package:restaurant_tour/presentation/widgets/restaurant_details/address_section.dart';
import 'package:restaurant_tour/presentation/widgets/restaurant_details/general_info_section.dart';
import 'package:restaurant_tour/presentation/widgets/restaurant_details/overall_rating_section.dart';
import 'package:restaurant_tour/presentation/widgets/restaurant_details/reviews_section.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    context.read<FavoritesCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;

    return BlocProvider.value(
      value: getIt.get<FavoritesCubit>(),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          context.read<FavoritesCubit>().isFavorite(restaurant);

          return Scaffold(
            appBar: AppBar(
              title: Text(restaurant.name ?? ''),
              actions: [
                IconButton(
                  icon: Icon(
                    state is FavoritesIsFavorite && state.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                  ),
                  onPressed: () {
                    if (state is FavoritesIsFavorite && state.isFavorite) {
                      context.read<FavoritesCubit>().removeFavorite(restaurant);
                      return;
                    }

                    context.read<FavoritesCubit>().saveFavorite(restaurant);
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    key: Key(restaurant.heroImage),
                    tag: restaurant.heroImage,
                    transitionOnUserGestures: true,
                    child: Image.network(
                      restaurant.heroImage,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  GeneralInfoSection(restaurant: restaurant),
                  const SizedBox(
                    height: 24,
                  ),
                  AddressSection(restaurant: restaurant),
                  OverallRatingSection(restaurant: restaurant),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      '${restaurant.reviews?.length} Reviews',
                      style: AppTextStyles.openRegularText,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ReviewsSection(reviews: restaurant.reviews ?? []),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
