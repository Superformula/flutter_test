import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/features/home_page/presenter/bloc/home_screen_bloc.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenBloc>(
      create: (context) => HomeScreenBloc(),
      child: _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RestauranTour'),
        ),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Restaurant Tour'),
            ElevatedButton(
              onPressed: () async {
                final yelpRepo = YelpRepository();
                try {
                  final result = await yelpRepo.getRestaurants();
                  if (result != null) {
                    debugPrint(
                        'Fetched ${result.restaurants!.length} restaurants');
                  } else {
                    debugPrint('No restaurants fetched');
                  }
                } catch (e) {
                  debugPrint('Failed to fetch restaurants: $e');
                }
              },
              child: const Text('Fetch Restaurants'),
            ),
          ],
        ),
      ),
    );
  }
}
