import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/presenters/favorites_restaurants_tab_presenter.dart';
import 'package:restaurant/presentation/view/widgets/bodies/error_body.dart';
import 'package:restaurant/presentation/view/widgets/cards/restaurant_card.dart';
import 'package:restaurant/presentation/view/widgets/empty_states/favorite_empty_widget.dart';
import 'package:restaurant/presentation/view/widgets/loading_body.dart';
import 'package:state_management/presentation/sf_state.dart';

class FavoriteRestaurantsTab extends StatelessWidget {
  const FavoriteRestaurantsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var presenter = context.read<FavoriteRestaurantsTabPresenter>();
      presenter.loadRestaurants();
      return BlocBuilder<FavoriteRestaurantsTabPresenter, SFState>(
        builder: (context, state) {
          if (state is SFErrorState) {
            return ErrorBody(reloadFunction: presenter.loadRestaurants);
          }
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
                  return RestaurantCard(
                    restaurant: restaurant,
                    index: index,
                    refreshCallback: () => context
                        .read<FavoriteRestaurantsTabPresenter>()
                        .loadRestaurants(),
                  );
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
