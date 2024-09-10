import 'package:flutter/material.dart';
import 'package:restaurant_tour/presentation/pages/restaurant_details/widgets/restaurant_details_favorite_button.dart';
import '../../../models/restaurant.dart';
import 'widgets/restaurant_details_data_widget.dart';
import 'widgets/restaurant_details_review_list_widget.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailsPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          RestaurantDetailsFavoriteButton(restaurant: restaurant)
        ],
        centerTitle: true,
        title: Text(
          restaurant.name ?? 'Unknown Restaurant',
          style: const TextStyle(
            fontFamily: 'Lora',
          ),
        ),
      ),
      body: ListView(
        children: [
          // Main photo
          SizedBox.square(
            dimension: MediaQuery.sizeOf(context).width,
            child: Hero(
              tag: restaurant.id ?? 'heroImage',
              child: Image.network(
                restaurant.heroImage,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          // Price/Category/Open-closed row
          RestaurantDetailsDataWidget(restaurant: restaurant,),
          // Reviews
          RestaurantDetailsReviewListWidget(reviews: restaurant.reviews ?? [],),
        ],
      ),
    );
  }
}
