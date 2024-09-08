import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/controllers/restaurant_view_controller.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_list.dart';

final class RestaurantsListScreen extends StatefulWidget {
  const RestaurantsListScreen({
    super.key,
    required this.viewController,
    required this.onSelectFavoriteCallback,
  });

  final RestaurantViewController viewController;
  final OnSelectFavoriteCallback onSelectFavoriteCallback;

  @override
  State<RestaurantsListScreen> createState() => _RestaurantsListScreenState();
}

class _RestaurantsListScreenState extends State<RestaurantsListScreen> with AutomaticKeepAliveClientMixin {
  late final viewController = widget.viewController;

  @override
  void initState() {
    super.initState();

    viewController.getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<RestaurantViewController, RestaurantViewModel>(
      bloc: viewController,
      builder: (context, state) {
        // TODO fix
        Widget content = const SizedBox.shrink();

        if (state is RestaurantViewModelLoading) {
          content = const Center(child: CircularProgressIndicator());
        } else {
          if (state is RestaurantViewModelData) {
            content = RestaurantsList(
              restaurants: state.restaurants,
              onSelectFavorite: widget.onSelectFavoriteCallback,
            );
          }
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: content,
        );
      },
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
