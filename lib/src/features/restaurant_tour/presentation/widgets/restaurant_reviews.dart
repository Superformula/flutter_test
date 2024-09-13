import 'package:flutter/material.dart';
import 'package:restaurant_tour/typography.dart';

class RestaurantReviews extends StatelessWidget {
  const RestaurantReviews({super.key});

  Row _buildStarIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(
          4,
          (index) => const Icon(
            Icons.star,
            color: Color(0xffffb800),
          ),
        ),
      ],
    );
  }

  Text _buildTextSection() {
    return const Text(
      'Review text goes there. Review text goes here. This is a review. This is a review that is 3 lines long.',
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
            'https://cdn.openart.ai/stable_diffusion/872b4795cdc6c81e042cb9494c5c7a499c9ec899_2000x2000.webp',
            fit: BoxFit.cover,
            height: 45,
            width: 45,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        const Text(
          'Iron Man',
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
