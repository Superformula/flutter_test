import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:restaurant_gql_client/restaurant_gql_client.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:restaurant_tour/restaurant_list/restaurant_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final client = Client();
  final gqlClient = RestaurantGqlClient(client);
  final repository = RestaurantRepository(gqlClient);

  runApp(RestaurantTour(restaurantRepository: repository));
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key, required this.restaurantRepository});

  final RestaurantRepository restaurantRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: restaurantRepository,
      child: BlocProvider(
        create: (context) => RestaurantListBloc(
          context.read<RestaurantRepository>(),
        )..add(const FetchRestaurantList()),
        child: const MaterialApp(
          title: 'Restaurant Tour',
          home: HomePage(),
        ),
      ),
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
          title: const Text('Restaurant Tour'),
          bottom: const TabBar(
            tabs: [
              Text('All Restaurants'),
              Text('My Favorites'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const RestaurantListView(),
            Container(),
          ],
        ),
      ),
    );
  }
}
