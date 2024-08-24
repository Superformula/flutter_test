import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/cubit/cubit.dart';
import 'package:restaurant_tour/models/models.dart';
import 'package:restaurant_tour/widgets/open_status.dart';
import 'package:restaurant_tour/widgets/rating_widget.dart';

import '../widgets/restaurant_details.dart';

class RestaurantListPageView extends StatelessWidget {
  const RestaurantListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<RestaurantCubit, RestaurantState>(
          builder: (context, state) {
            if (state is LoadingRestaurantsState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is RestaurantsLoadedState) {
              return ListView.builder(
                itemCount: state.result.restaurants?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        restaurant: state.result.restaurants!.elementAt(index),
                        constraints: constraints,
                      ),
                    ],
                  );
                },
              );
            }
            return Container();
          },
        );
      },
    );
  }
}

class ListTile extends StatelessWidget {
  const ListTile({
    super.key,
    required this.restaurant,
    required this.constraints,
  });
  final Restaurant restaurant;
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth,
      margin: const EdgeInsets.only(bottom: 8, top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Hero(
                tag: restaurant.id.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.network(
                    restaurant.heroImage,
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Flexible(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name ?? '',
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                RestaurantDetails(restaurant: restaurant),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    StarRating(
                      rating: restaurant.rating?.round() ?? 0,
                    ),
                    Spacer(),
                    OpenStatus(
                      isOpen: restaurant.isOpen,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
