import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/restaurant.dart';
import '../../cubit/favorite/favorite_cubit.dart';
import '../restaurant/restaurant_page.dart';
import '../../widgets/restaurant_card_widget.dart';

class FavoritesListBuilder extends StatefulWidget {
  final List<Restaurant> restaurants;

  const FavoritesListBuilder({
    super.key,
    required this.restaurants,
  });

  @override
  State<FavoritesListBuilder> createState() => _FavoritesListBuilderState();
}

class _FavoritesListBuilderState extends State<FavoritesListBuilder> {
  FavoriteCubit get favoriteCubit => context.read<FavoriteCubit>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.builder(
        itemCount: widget.restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = widget.restaurants.elementAt(index);
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
            restaurant: widget.restaurants[index],
          );
        },
      ),
    );
  }
}
