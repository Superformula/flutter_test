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
      theme: ThemeData(
        fontFamily: 'Lora', // Set Lora as the default font for the entire app
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontFamily: 'Lora',
            fontSize: 16.0,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Color(0xFFEEEEEE),
          space: 1, // Height of the divider (same as space around it)
        ),
      ),
      home: HomePage(),
    );
  }
}