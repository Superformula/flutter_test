import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/presentation/restaurants/restaurants_bloc.dart';
import 'package:restaurant_tour/view/pages/restaurant_page.dart';
import 'package:restaurant_tour/view/widgets/restaurant_tile.dart';

class RestaurantListWidget extends StatefulWidget {
  const RestaurantListWidget({super.key});

  @override
  State<RestaurantListWidget> createState() => _RestaurantListWidgetState();
}

class _RestaurantListWidgetState extends State<RestaurantListWidget> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  void addMore() {
    final blocState =
        (GetIt.I.get<RestaurantsBloc>().state) as RestaurantsReady;
    GetIt.I.get<RestaurantsBloc>().add(
        AddMoreRestaurants(offset: blocState.size, limit: blocState.limit));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantsBloc, RestaurantsState>(
      bloc: GetIt.I.get<RestaurantsBloc>(),
      builder: (context, state) {
        if (state is RestaurantsReady) {
          return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    height: 2,
                  ),
              itemCount: state.restaurants.length + 1,
              controller: _scrollController,
              itemBuilder: (context, index) {
                if (index == state.restaurants.length && state.isLoadingMore) {
                  return const Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (index == state.restaurants.length && state.hasError) {
                  return ElevatedButton(
                      onPressed: addMore,
                      child: const Text(
                        'Error trying to fetch more, try again',
                      ));
                }
                if (index == state.restaurants.length) {
                  return ElevatedButton(
                      onPressed: addMore,
                      child: const Text(
                        'Load more',
                      ));
                }

                return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<RestaurantPage>(
                            builder: (context) => RestaurantPage(
                              restaurant: state.restaurants[index],
                            ),
                          ),
                        ),
                    child:
                        RestaurantTile(restaurant: state.restaurants[index]));
              });
        }
        if (state is RestaurantsError) {
          return Center(
            child: Text(state.exception.description),
          );
        }

        if (state is RestaurantsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}
