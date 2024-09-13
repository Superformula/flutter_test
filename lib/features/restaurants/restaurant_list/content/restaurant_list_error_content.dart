import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/cubit/cubit.dart';

class RestaurantListErrorContent extends StatelessWidget {
  const RestaurantListErrorContent({
    required this.errorMesssage,
    super.key,
  });

  final String errorMesssage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMesssage,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12.0,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<RestaurantListCubit>().getRestaurants();
          },
          child: const Text('Try again'),
        ),
      ],
    );
  }
}
