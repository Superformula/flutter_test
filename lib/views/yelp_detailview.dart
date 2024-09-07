import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/viewmodels/favorites_viewmodel.dart';
import 'package:restaurant_tour/viewmodels/yelp_detail_viewmodel.dart';

class YelpDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final detailViewModel = context.watch<YelpDetailViewModel>();
    final restaurant = detailViewModel.selectedRestaurant ?? ModalRoute.of(context)?.settings.arguments as Restaurant?;

    if (restaurant == null) {
      return const Center(child: Text("No restaurant selected"));
    }
    final favoritesViewModel = context.watch<FavoritesViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name!),
        actions: [
          FutureBuilder<bool>(
            future: favoritesViewModel.isFavorite(restaurant.id!),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return IconButton(
                  icon: const Icon(Icons.star_border),
                  onPressed: () {},
                );
              }

              final isFavorite = snapshot.data ?? false;

              return IconButton(
                icon: Icon(isFavorite ? Icons.star : Icons.star_border),
                onPressed: () {
                  if (isFavorite) {
                    favoritesViewModel.removeFavorite(restaurant.id!);
                  } else {
                    favoritesViewModel.addFavorite(restaurant.id!);
                  }
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(restaurant.photos?.first),
              const SizedBox(height: 16),
              _buildRestaurantInfoRow(restaurant),
              const SizedBox(height: 16),
              const _SectionTitle(title: 'Address'),
              const SizedBox(height: 8),
              Text(restaurant.location?.formattedAddress ?? 'No address available'),
              const SizedBox(height: 16),
              const _SectionTitle(title: 'Overall Ratings'),
              const SizedBox(height: 8),
              _buildRatingsRow(restaurant),
              const SizedBox(height: 16),
              _buildReviewsSection(restaurant),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String? url) {
    return url != null
        ? Image.network(
      url,
      height: 360,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return _imagePlaceholder();
      },
    )
        : _imagePlaceholder();
  }

  Widget _imagePlaceholder() {
    return Container(
      height: 360,
      width: double.infinity,
      color: Colors.grey[300],
      child: const Icon(
        Icons.image_not_supported,
        size: 100,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildRestaurantInfoRow(Restaurant restaurant) {
    return Row(
      children: [
        Text(
          '${restaurant.price ?? ''} ${restaurant.categories?.first.title ?? ''}',
          style: const TextStyle(fontSize: 16),
        ),
        const Spacer(),
        Row(
          children: [
            Icon(
              Icons.circle,
              size: 12,
              color: restaurant.isOpen ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 4),
            Text(
              restaurant.isOpen ? 'Open now' : 'Closed',
              style: TextStyle(
                color: restaurant.isOpen ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingsRow(Restaurant restaurant) {
    return Row(
      children: [
        Text(
          '${restaurant.rating?.toString() ?? 'N/A'} ',
          style: const TextStyle(fontSize: 16),
        ),
        const Icon(
          Icons.star,
          size: 16,
          color: Colors.amber,
        )
      ],
    );
  }

  Widget _buildStars(int? rating) {
    if (rating == null) return Container();
    return Row(
      children: List.generate(
        rating,
            (index) => const Icon(
          Icons.star,
          size: 16,
          color: Colors.amber,
        ),
      ),
    );
  }

  Widget _buildReviewsSection(Restaurant restaurant) {
    if (restaurant.reviews == null || restaurant.reviews!.isEmpty) {
      return const Text('No reviews available');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: 'Reviews (${restaurant.reviews!.length})'),
        const SizedBox(height: 8),
        Column(
          children: restaurant.reviews!
              .map<Widget>((review) => _buildReviewItem(review))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildReviewItem(Review review) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStars(review.rating),
          const SizedBox(height: 8),
          Text(review.text ?? '', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildReviewerImage(review.user?.imageUrl),
              const SizedBox(width: 8),
              Text(review.user?.name ?? 'Anonymous'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewerImage(String? url) {
    return CircleAvatar(
      radius: 24,
      backgroundImage: url != null ? NetworkImage(url) : null,
      child: url == null
          ? const Icon(Icons.person, size: 24, color: Colors.white)
          : null,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
