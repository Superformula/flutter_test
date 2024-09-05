import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/presenters/favorites_restaurants_tab_presenter.dart';
import 'package:restaurant/presentation/view/widgets/cards/restaurant_card.dart';
import 'package:restaurant/presentation/view/widgets/empty_states/favorite_empty_widget.dart';
import 'package:restaurant/presentation/view/widgets/loading_body.dart';
import 'package:state_management/presentation/sf_state.dart';

class FavoriteRestaurantsTab extends StatelessWidget {
  const FavoriteRestaurantsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteRestaurantsTabPresenter>(
      create: (context) {
        var presenter = FavoriteRestaurantsTabPresenter();

        // presenter.loadRestaurants();
        return presenter;
      },
      child: Builder(builder: (context) {
        context.read<FavoriteRestaurantsTabPresenter>().loadRestaurants();
        return BlocBuilder<FavoriteRestaurantsTabPresenter, SFState>(
          builder: (context, state) {
            if (state is SFSuccessState<List<Restaurant>>) {
              if (state.object.isEmpty) {
                return const FavoritesEmpyWidget();
              }
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: state.object.length,
                  itemBuilder: (context, index) {
                    var restaurant = state.object[index];
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.13,
                      child: RestaurantCard(restaurant: restaurant),
                    );
                  },
                ),
              );
            }
            return const LoadingBody();
          },
        );
      }),
    );
  }
}
