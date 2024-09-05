import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/presenters/all_restaurants_tab_presenter.dart';
import 'package:restaurant/presentation/view/widgets/cards/restaurant_card.dart';
import 'package:restaurant/presentation/view/widgets/loading_body.dart';
import 'package:state_management/presentation/sf_state.dart';

class AllRestaurantsTab extends StatelessWidget {
  const AllRestaurantsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var presenter = context.read<AllRestaurantsTabPresenter>();

      presenter.loadRestaurants();
      return BlocBuilder<AllRestaurantsTabPresenter, SFState>(
        builder: (context, state) {
          if (state is SFSuccessState<RestaurantQueryResult>) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ListView.builder(
                itemCount: state.object.restaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = state.object.restaurants[index];
                  return RestaurantCard(restaurant: restaurant);
                },
              ),
            );
          }
          return const LoadingBody();
        },
      );
    });
  }
}
