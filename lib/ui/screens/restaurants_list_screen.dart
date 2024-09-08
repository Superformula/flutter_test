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
      final pixels = position.pixels;
      final extent = position.maxScrollExtent * 0.85;

      if (pixels >= extent && viewController.currentState is! RestaurantViewModelLoadingMore) {
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
        // TODO fix
        Widget content = const SizedBox.shrink();

        if (state is RestaurantViewModelLoading) {
          content = const Center(child: CircularProgressIndicator());
        } else {
          if (state is RestaurantViewModelData) {
            content = RestaurantsList(
              controller: scrollController,
              restaurants: state.restaurants,
              onSelectFavorite: widget.onSelectFavorite,
              onLoadSingleFavorite: widget.onLoadSingleFavorite,
            );
          } else if (state is RestaurantViewModelLoadingMore) {
            content = Column(
              children: [
                Expanded(
                  child: RestaurantsList(
                    controller: scrollController,
                    restaurants: state.previousRestaurants,
                    onSelectFavorite: widget.onSelectFavorite,
                    onLoadSingleFavorite: widget.onLoadSingleFavorite,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            );
          }
        }

        return content;
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
