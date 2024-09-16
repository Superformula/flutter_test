import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/view/cubit/favorite/favorite.dart';

import '../../../cubit/restaurants/restaurants.dart';
import '../../../widgets/restaurant_card_widget.dart';
import '../../restaurant/restaurant_page.dart';

class RestaurantsTabWidget extends StatefulWidget {
  const RestaurantsTabWidget({super.key});

  @override
  State<RestaurantsTabWidget> createState() => _RestaurantsTabWidgetState();
}

class _RestaurantsTabWidgetState extends State<RestaurantsTabWidget> {
  FavoriteCubit get favoriteCubit => context.read<FavoriteCubit>();

  @override
  Widget build(BuildContext context) =>
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
                    final restaurant = state.restaurants.elementAt(index);

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
      );
}
