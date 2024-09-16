import 'package:flutter/material.dart';

import 'factories/factories.dart';

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Tour',
      initialRoute: '/',
      routes: {
        '/': (_) => makeRestaurantTourPage(),
      },
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFFAFAFA),
        ),
      ),
    );
  }
}
