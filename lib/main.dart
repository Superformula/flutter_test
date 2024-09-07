import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/viewmodels/favorites_viewmodel.dart';
import 'package:restaurant_tour/viewmodels/yelp_list_viewmodel.dart';
import 'package:restaurant_tour/views/homepage.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => YelpListViewModel()),
          ChangeNotifierProvider(create: (_) => FavoritesViewModel()),
        ],
        child: RestaurantTour(),
      ),
  );
}

class RestaurantTour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Tour',
      home: HomePage(),
    );
  }
}