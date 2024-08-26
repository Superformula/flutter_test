import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/cubit/cubit.dart';
import 'package:restaurant_tour/models/models.dart';
import '../widgets/widgets.dart';
import 'restaurant_detail_page.dart';

class RestaurantListPageView extends StatelessWidget {
  const RestaurantListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<RestaurantCubit, RestaurantState>(
          buildWhen: (previous, current) =>
              current is LoadingRestaurantsState ||
              current is RestaurantsLoadedState ||
              current is ErrorState,
          builder: (context, state) {
            if (state is LoadingRestaurantsState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is RestaurantsLoadedState ||
                state is FavoriteRestaurantState) {
              return ListView.builder(
                itemCount: state.result!.restaurants?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RestaurantListTile(
                        restaurant: state.result!.restaurants!.elementAt(index),
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

class RestaurantListTile extends StatelessWidget {
  const RestaurantListTile({
    super.key,
    required this.restaurant,
    required this.constraints,
  });
  final Restaurant restaurant;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailPage(restaurant: restaurant),
          ),
        );
      },
      child: Container(
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
                HeroImageWidget(
                  restaurant: restaurant,
                  width: 90,
                  height: 90,
                  borderRadius: 9.0,
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
                  PriceAndClassificationRowWidget(restaurant: restaurant),
                  const SizedBox(
                    height: 10,
                  ),
                  RatingAndOpenStatusWidget(restaurant: restaurant)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
