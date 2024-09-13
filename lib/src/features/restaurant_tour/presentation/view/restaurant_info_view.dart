import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/constants/strings.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_reviews.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/star_icon.dart';
import 'package:restaurant_tour/typography.dart';

class RestaurantInfoView extends StatefulWidget {
  const RestaurantInfoView({super.key});

  @override
  State<RestaurantInfoView> createState() => _RestaurantInfoViewState();
}

class _RestaurantInfoViewState extends State<RestaurantInfoView> {
  List<Widget> _buildAddressSection() {
    return [
      const Text(
        addressText,
        style: AppTextStyles.openRegularText,
      ),
      const SizedBox(height: 14),
      const SizedBox(
        width: 150,
        child: Text(
          '102 Lakeside Ave Seattle, WA 98122',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.openRegularTitleSemiBold,
        ),
      ),
    ];
  }

  List<Widget> _buildAvailabilitySection() {
    return [
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$\$\$\$ Italian',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.openRegularText,
          ),
          Spacer(),
          SizedBox(
            child: Text(
              'Open Now',
              style: AppTextStyles.openRegularItalic,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.circle,
              color: Colors.green,
              size: 12.0,
            ),
          ),
        ],
      ),
    ];
  }

  Widget _buildImage() {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: Image.network(
        'https://media.es.wired.com/photos/64370c54f381a957088482cc/4:3/w_2668,h_2001,c_limit/reboot%20de%20harry%20potter%20warner.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  List<Widget> _buildOverallRatingSection() {
    return [
      const Text(
        overallRatingText,
        style: AppTextStyles.openRegularText,
      ),
      const SizedBox(height: 14),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '4.6',
            style: AppTextStyles.loraRegularHeadline.copyWith(
              fontSize: 28,
            ),
          ),
          const StarIcon(),
        ],
      ),
    ];
  }

  List<Widget> _divider() {
    return [
      const SizedBox(height: 14),
      const Divider(),
      const SizedBox(height: 14),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildImage(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._buildAvailabilitySection(),
                ..._divider(),
                ..._buildAddressSection(),
                ..._divider(),
                ..._buildOverallRatingSection(),
                ..._divider(),
                const Text(
                  '42 $reviewsText',
                  style: AppTextStyles.openRegularText,
                ),
                ...List.generate(
                  4,
                  (index) => const RestaurantReviews(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
