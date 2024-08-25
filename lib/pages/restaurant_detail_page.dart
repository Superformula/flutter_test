import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/widgets/divider.dart';
import 'package:restaurant_tour/widgets/widgets.dart';

const spacingXL = 24.0;
const spacingM = 16.0;
const spacingSM = 8.0;

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key, required this.restaurant});
  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name ?? ''),
      ),
      body: SafeArea(
        // minimum: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  HeroImageWidget(
                    restaurant: restaurant,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildCategoryStatusRow(restaurant: restaurant),
                        const SizedBox(
                          height: spacingXL,
                        ),
                        buildDivider(),
                        const SizedBox(
                          height: spacingXL,
                        ),
                        Text(
                          'Address',
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: spacingXL,
                        ),
                        Text(
                          restaurant.location?.formattedAddress ??
                              'No Address Informed',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(
                          height: spacingXL,
                        ),
                        buildDivider(),
                        restaurant.rating != null
                            ? BuildRatingSection(
                                restaurant: restaurant,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BuildCategoryStatusRow extends StatelessWidget {
  const BuildCategoryStatusRow({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: PriceAndClassificationRowWidget(
            restaurant: restaurant,
          ),
        ),
        const Spacer(),
        OpenStatusWidget(
          isOpen: restaurant.isOpen,
        ),
      ],
    );
  }
}
