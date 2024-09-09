import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/controllers/restaurant_view_controller.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_list.dart';

final class RestaurantsListScreen extends StatefulWidget {
  const RestaurantsListScreen({
    super.key,
    required this.viewController,
    required this.onSelectFavorite,
    required this.onLoadSingleFavorite,
  });

  final RestaurantViewController viewController;
  final OnSelectFavoriteCallback onSelectFavorite;
  final OnLoadSingleFavorite onLoadSingleFavorite;

  @override
  State<RestaurantsListScreen> createState() => _RestaurantsListScreenState();
}

class _RestaurantsListScreenState extends State<RestaurantsListScreen> with AutomaticKeepAliveClientMixin {
  late final viewController = widget.viewController;
  late final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    viewController.getRestaurants();
    scrollController.addListener(onScrollToEnd);
  }

  @override
  void dispose() {
    scrollController.removeListener(onScrollToEnd);
    scrollController.dispose();
    super.dispose();
  }

  void onScrollToEnd() {
    if (mounted && scrollController.hasClients) {
      final position = scrollController.position;

      if (position.maxScrollExtent == scrollController.offset) {
        viewController.getMoreRestaurants();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<RestaurantViewController, RestaurantViewModel>(
      bloc: viewController,
      builder: (context, state) {

        if (state is RestaurantViewModelLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (state is RestaurantViewModelData) {
            return RestaurantsList(
              controller: scrollController,
              restaurants: state.restaurants,
              onSelectFavorite: widget.onSelectFavorite,
              onLoadSingleFavorite: widget.onLoadSingleFavorite,
              shouldDisplayLoading: true,
            );
          } 
        }

        return const SizedBox.shrink();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
