import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:restaurant_gql_client/restaurant_gql_client.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:restaurant_tour/favorite_restaurants_list/bloc/favorite_restaurants_bloc.dart';
import 'package:restaurant_tour/favorite_restaurants_list/view/view.dart';
import 'package:restaurant_tour/restaurant_detail/restaurant_detail.dart';
import 'package:restaurant_tour/restaurant_list/restaurant_list.dart';
import 'package:restaurant_ui/restaurant_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client = Client();
  const apiKey = String.fromEnvironment('API_KEY');
  const baseUrl = 'https://api.yelp.com/v3/graphql';
  final gqlClient = RestaurantGqlClient(client, baseUrl, apiKey);
  final sharedPreferences = await SharedPreferences.getInstance();
  final repository = RestaurantRepository(gqlClient, sharedPreferences);

  runApp(RestaurantTour(restaurantRepository: repository));
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key, required this.restaurantRepository});

  final RestaurantRepository restaurantRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: restaurantRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RestaurantListBloc(
              restaurantRepository,
            )..add(const FetchRestaurantList()),
          ),
          BlocProvider(
            create: (context) => FavoriteRestaurantsBloc(restaurantRepository)
              ..add(const FetchFavoriteRestaurants()),
          ),
          BlocProvider(
            create: (context) => RestaurantDetailBloc(restaurantRepository),
          ),
        ],
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
          centerTitle: true,
          title: const Text(
            'Restaurant Tour',
            style: AppTextStyles.loraRegularHeadline,
          ),
          bottom: const TabBar(
            tabs: [
              Text(
                'All Restaurants',
                style: AppTextStyles.loraRegularTitle,
              ),
              Text(
                'My Favorites',
                style: AppTextStyles.loraRegularTitle,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RestaurantListView(),
            FavoriteRestaurantsListView(),
          ],
        ),
      ),
    );
  }
}
