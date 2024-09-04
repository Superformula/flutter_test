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
    return BlocProvider<AllRestaurantsTabPresenter>(
      create: (context) {
        var presenter = AllRestaurantsTabPresenter();

        // presenter.loadRestaurants();
        return presenter;
      },
      child: Builder(builder: (context) {
        context.read<AllRestaurantsTabPresenter>().loadRestaurants();
        return BlocBuilder<AllRestaurantsTabPresenter, SFState>(
          builder: (context, state) {
            if (state is SFSuccessState<RestaurantQueryResult>) {
              return ListView.builder(
                itemCount: state.object.restaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = state.object.restaurants[index];
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.13,
                    child: RestaurantCard(restaurant: restaurant),
                  );
                },
              );
            }
            return const LoadingBody();
          },
        );
      }),
    );
  }
}
