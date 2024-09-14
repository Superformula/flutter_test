import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/constants/strings.dart';
import 'package:restaurant_tour/src/constants/typography.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_reviews.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/star_icon.dart';

class RestaurantInfoView extends StatefulWidget {
  const RestaurantInfoView({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  State<RestaurantInfoView> createState() => _RestaurantInfoViewState();
}

class _RestaurantInfoViewState extends State<RestaurantInfoView> {
  bool _showProgressIndicator = true;

  @override
  void initState() {
    super.initState();
    _initializeLoading();
  }

  List<Widget> _buildAddressSection() {
    return [
      const Text(
        addressText,
        style: AppTextStyles.openRegularText,
      ),
      const SizedBox(height: 14),
      SizedBox(
        width: 150,
        child: Text(
          widget.restaurant.location?.formattedAddress ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.openRegularTitleSemiBold,
        ),
      ),
    ];
  }

  List<Widget> _buildAvailabilitySection() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${widget.restaurant.price} ${widget.restaurant.categories![0].title}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.openRegularText,
          ),
          const Spacer(),
          SizedBox(
            child: Text(
              widget.restaurant.isOpen ? openNowText : closedText,
              style: AppTextStyles.openRegularItalic,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.circle,
              color: widget.restaurant.isOpen ? Colors.green : Colors.red,
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
        widget.restaurant.heroImage,
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
            widget.restaurant.rating.toString(),
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

  void _initializeLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        _showProgressIndicator = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !_showProgressIndicator
        ? SingleChildScrollView(
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
                      Text(
                        '${widget.restaurant.reviews?.length ?? 0} $reviewsText',
                        style: AppTextStyles.openRegularText,
                      ),
                      ...List.generate(
                        widget.restaurant.reviews?.length ?? 0,
                        (index) => RestaurantReviews(
                          reviews: widget.restaurant.reviews![index],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
  }
}
