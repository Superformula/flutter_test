import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/ui/foundations/typography.dart';
import 'package:restaurant_tour/ui/widgets/availability_widget.dart';
import 'package:restaurant_tour/ui/widgets/divider_widget.dart';

class DetailInfoWidget extends StatelessWidget {
  final String price;
  final String category;
  final bool isOpen;
  final String address;
  final double rating;

  const DetailInfoWidget({
    super.key,
    required this.price,
    required this.category,
    required this.isOpen,
    required this.address,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _getBody(),
    );
  }

  List<Widget> _getBody() {
    return [
      Row(
        children: [
          Text(
            '$price $category',
            style: AppTextStyles.openRegularText,
          ),
          const Spacer(),
          AvailabilityWidget(
            isRestaurantOpen: isOpen,
          ),
        ],
      ),
      const DividerWidget(),
      const Text(AppConstants.addres, style: AppTextStyles.openRegularText),
      const SizedBox(height: 16.0),
      Text(address, style: AppTextStyles.openRegularTitleSemiBold),
      const DividerWidget(),
      const Text(AppConstants.overrallRating, style: AppTextStyles.openRegularText),
      const SizedBox(height: 16.0),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(rating.toString(), style: AppTextStyles.loraRegularTitle2),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: SvgPicture.asset(
              'assets/images/star.svg',
              width: 12,
              height: 12,
            ),
          ),
        ],
      ),
      const DividerWidget(),
      const SizedBox(height: 16.0),
    ];
  }
}
