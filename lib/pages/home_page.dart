import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/cubit/cubit.dart';
import 'package:restaurant_tour/pages/restaurant_list_page_view.dart';

class HomePageBlocProvider extends StatelessWidget {
  const HomePageBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<RestaurantCubit>()..fetchRestaurants(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "RestauranTour",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextButton(
                onPressed: () {},
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://mdbcdn.b-cdn.net/img/new/avatars/2.webp',
                  ),
                ),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'All restaurants',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Tab(
                child: Text(
                  'My favorites',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ],
          ),
        ),
        body: const SafeArea(
          minimum: EdgeInsets.all(16),
          child: TabBarView(
            children: [
              RestaurantListPageView(),
              Text('Dias'),
            ],
          ),
        ),
      ),
    );
  }
}
