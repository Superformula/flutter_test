import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_tour/restaurant_detail/restaurant_detail.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

class RestaurantDetailView extends StatelessWidget {
  const RestaurantDetailView({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RestaurantDetailBloc>()
        ..add(FetchRestaurantIsFavorite(restaurant: restaurant)),
      child: BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
        builder: (context, state) {
          if (state is RestaurantDetailLoading) {
            return const CircularProgressIndicator();
          }

          if (state is RestaurantDetailLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  restaurant.name ?? '',
                  style: AppTextStyles.loraRegularHeadline,
                ),
                actions: [
                  GestureDetector(
                    onTap: () => context
                        .read<RestaurantDetailBloc>()
                        .add(ToggleRestaurantFavorite(restaurant: restaurant)),
                    child: Icon(
                      state.isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    HeaderSection(
                      imageUrl: restaurant.heroImage,
                      id: restaurant.id ?? '',
                      price: restaurant.price ?? '',
                      category: restaurant.displayCategory,
                      isOpen: restaurant.isOpen,
                    ),
                    AddressSection(
                      address: restaurant.location?.formattedAddress ?? '',
                    ),
                    RatingSection(rating: restaurant.rating ?? 0),
                    ReviewsSection(reviews: restaurant.reviews ?? []),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.imageUrl,
    required this.id,
    required this.price,
    required this.category,
    required this.isOpen,
  });

  final String imageUrl;
  final String id;
  final String price;
  final String category;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Hero(
            tag: id,
            child: RestaurantNetworkImage(
              height: 450,
              width: MediaQuery.of(context).size.width,
              radius: 0,
              photoUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$price $category'),
                RestaurantStatus(isOpen: isOpen),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressSection extends StatelessWidget {
  const AddressSection({super.key, required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Address', style: AppTextStyles.openRegularTitle),
            const SizedBox(height: 16),
            Text(address, style: AppTextStyles.openRegularTitleSemiBold),
            const SizedBox(height: 16),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class RatingSection extends StatelessWidget {
  const RatingSection({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overall Rating',
              style: AppTextStyles.openRegularTitle,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  rating.toString(),
                  style: const TextStyle(
                    fontFamily: 'Lora',
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
                const Icon(Icons.star, color: Colors.yellow),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
    required this.reviews,
  });

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: RestaurantReview(
            rating: review.rating ?? 0,
            review: review.text ?? '',
            userName: review.user?.name ?? '',
            userPhoto: review.user?.imageUrl ?? '',
          ),
        );
      },
    );
  }
}
