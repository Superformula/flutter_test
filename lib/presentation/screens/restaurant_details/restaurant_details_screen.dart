import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/models/review.dart';
import 'package:restaurant_tour/domain/models/user.dart';
import 'package:restaurant_tour/presentation/components/review_card.dart';

import 'package:restaurant_tour/core/theme/colors.dart';
import 'package:restaurant_tour/core/theme/typography.dart';
import 'package:restaurant_tour/presentation/components/rating_stars.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final Restaurant restaurant;
  final VoidCallback onToggleFavorite;
  final bool isFavorite;

  const RestaurantDetailsScreen({
    super.key,
    required this.restaurant,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  String get openStatusLabel =>
      widget.restaurant.isOpen ? "Open Now" : "Closed";

  Color get openStatusColor => widget.restaurant.isOpen
      ? const Color(0xFF5CD313)
      : const Color(0xFFEA5E5E);

  IconData get favoriteIcon =>
      isFavorite ? Icons.favorite : Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name!),
        actions: [
          IconButton(
            icon: Icon(favoriteIcon),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
                widget.onToggleFavorite();
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 361,
            child: Image.network(
              widget.restaurant.heroImage,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.restaurant.price!} ${widget.restaurant.displayCategory} ",
                      style: AppTextStyles.openRegularText,
                    ),
                    const Spacer(),
                    Text(
                      openStatusLabel,
                      style: AppTextStyles.openRegularItalic,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: openStatusColor,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    height: 1,
                    color: AppColors.dividerColor,
                  ),
                ),
                Text(
                  widget.restaurant.location?.formattedAddress ??
                      "102 Lakeside Ave Seattle, WA 98122",
                  style: AppTextStyles.openRegularTitleSemiBold,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    height: 1,
                    color: AppColors.dividerColor,
                  ),
                ),
                // Rating
                const Text(
                  "Overall Rating",
                  style: AppTextStyles.openRegularText,
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      widget.restaurant.rating.toString(),
                      style: AppTextStyles.loraRegularHeadline
                          .copyWith(fontSize: 28),
                    ),
                    const SizedBox(width: 2),
                    RatingStars(rating: widget.restaurant.rating!),
                  ],
                ),
                //-- Rating
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    height: 1,
                    color: AppColors.dividerColor,
                  ),
                ),
                // Reviews
                Text(
                  "${widget.restaurant.reviews!.length} Reviews",
                  style: AppTextStyles.openRegularText,
                ),
                // TODO: add real data
                const SizedBox(height: 16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.restaurant.reviews!.length,
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      height: 1,
                      color: AppColors.dividerColor,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return const ReviewCard(
                      review: Review(
                        id: 'asdasdasd',
                        rating: 4,
                        text:
                            "Review text goes here. Review text goes here. Review text goes here. This is a review. This is a review. This is a review that is 4 lines long.",
                        user: User(
                          id: "asdasd",
                          name: "User name",
                          imageUrl: "https://via.placeholder.com/150",
                        ),
                      ),
                    );
                  },
                ),

                //-- Reviews
              ],
            ),
          ),
        ],
      ),
    );
  }
}
