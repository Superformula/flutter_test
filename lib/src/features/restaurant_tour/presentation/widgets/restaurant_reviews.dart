import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/star_icon.dart';
import 'package:restaurant_tour/typography.dart';

class RestaurantReviews extends StatelessWidget {
  const RestaurantReviews({
    super.key,
    required this.reviews,
  });

  final Review reviews;

  Row _buildStarIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(
          reviews.rating ?? 0,
          (index) => const StarIcon(),
        ),
      ],
    );
  }

  Text _buildTextSection() {
    return Text(
      reviews.text ?? '',
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.openRegularHeadline,
    );
  }

  Row _buildUserInfo() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            reviews.user!.imageUrl!,
            fit: BoxFit.cover,
            height: 45,
            width: 45,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          reviews.user!.name!,
          style: AppTextStyles.openRegularText,
        ),
      ],
    );
  }

  Widget _space() {
    return const SizedBox(height: 14);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _space(),
        _buildStarIcons(),
        _space(),
        _buildTextSection(),
        _space(),
        _buildUserInfo(),
      ],
    );
  }
}
