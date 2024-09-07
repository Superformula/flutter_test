import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';
import 'package:restaurant_tour/viewmodels/yelp_list_viewmodel.dart';
import 'package:restaurant_tour/views/rootview.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
  ChangeNotifierProvider(
      create: (_) => YelpListViewModel(),
      child: RestaurantTour(),
  )
  );
}

class RestaurantTour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Restaurant Tour',
      home: RootView(),
    );
  }
}