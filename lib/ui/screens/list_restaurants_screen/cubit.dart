import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/ui/screens/list_restaurants_screen/state.dart';

import 'list_restaurants_screen.dart';

final class ListRestaurantsScreenCubit extends Cubit<ListRestaurantsScreenState> {
  ListRestaurantsScreenCubit({
    required this.repository,
  }) : super(const RestaurantsData());

  final RestaurantsRepository repository;

  Future<void> loadRestaurants() async {
    emit(const LoadingRestaurants());

    try {
      final data = await repository.getRestaurants();
      final restaurants = data?.restaurants ?? [];
      
      emit(
        RestaurantsData(restaurants: restaurants),
      );
    } on Exception catch (error, stackTrace) {
      emit(
        RestaurantsError(
          exception: error,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}

class ListRestaurantsScreenCubitWrapper extends StatefulWidget {
  const ListRestaurantsScreenCubitWrapper({super.key});

  @override
  State<ListRestaurantsScreenCubitWrapper> createState() => _ListRestaurantsScreenCubitWrapperState();
}

class _ListRestaurantsScreenCubitWrapperState extends State<ListRestaurantsScreenCubitWrapper> {
  late final ListRestaurantsScreenCubit cubit;

  @override
  void initState() {
    super.initState();
    final repository = context.read<RestaurantsRepository>();

    cubit = ListRestaurantsScreenCubit(repository: repository);
    cubit.loadRestaurants();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListRestaurantsScreenCubit, ListRestaurantsScreenState>(
      bloc: cubit,
      builder: (context, state) => ListRestaurantsScreen(state: state),
    );
  }
}
