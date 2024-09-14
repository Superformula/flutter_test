import 'package:flutter/material.dart';
import 'package:restaurant_tour/config/routes/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Restaurant Tour',
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouterManager.generateRoute,
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Restaurant Tour'),
          ElevatedButton(
            child: const Text('Fetch Restaurants'),
            onPressed: () async {},
          ),
        ],
      ),
    ),
  );
}
