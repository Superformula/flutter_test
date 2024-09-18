import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/di/di.dart';
import 'package:restaurant_tour/view/pages/main_page.dart';
import './view/theme/app_theme.dart';

void main() {
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatefulWidget {
  const RestaurantTour({super.key, this.testMode = false});
  final bool testMode;

  @override
  State<RestaurantTour> createState() => _RestaurantTourState();
}

class _RestaurantTourState extends State<RestaurantTour> {
  @override
  void initState() {
    setup(testMode: widget.testMode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Tour',
      theme: AppTheme.lightTheme,
      home: FutureBuilder(
        future: GetIt.I.allReady(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const MainPage();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
