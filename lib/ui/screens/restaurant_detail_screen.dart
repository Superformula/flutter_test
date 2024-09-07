import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/typography.dart';

final class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

final class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  static const divider = Divider(
    color: Color(0xffeeeeee),
    height: 1,
    thickness: 1,
    indent: 24,
    endIndent: 24,
  );

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          restaurant.name ?? '',
          style: AppTextStyles.loraRegularHeadline,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image here
              // extract this
              Center(
                child: Image.asset(
                  'assets/png/hero.png',
                  fit: BoxFit.fitWidth,
                  scale: 0.5,
                ),
              ),
              const Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    DefaultTextStyle(
                      style: AppTextStyles.openRegularText,
                      child: Row(
                        children: [
                          if (restaurant.price case final price?) Text(price),
                          //Text(restaurant.displayCategory),
                          const Gap(4),
                          const Text('Italian'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      restaurant.isOpen ? 'Open Now' : 'Closed',
                      style: AppTextStyles.openRegularItalic,
                    ),
                    const Gap(4),
                    SizedBox.square(
                      dimension: 8,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: restaurant.isOpen //
                              ? const Color(0xff5CD313)
                              : const Color(0xffEA5E5E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              divider,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Gap(24),
                    const Text(
                      'Address',
                      style: AppTextStyles.openRegularText,
                    ),
                    const Gap(24),
                    // TODO: fix
                    if (restaurant.location?.formattedAddress case final address?) //
                      Text(
                        address,
                        style: AppTextStyles.openRegularTitleSemiBold,
                      ),
                  ],
                ),
              ),
              const Gap(24),
              divider,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(24),
                    const Text(
                      'Overall Rating',
                      style: AppTextStyles.openRegularText,
                    ),
                    const Gap(16),
                    // TODO: fix
                    if (restaurant.rating case final rating?) //
                      Row(
                        children: [
                          Text(
                            rating.toString(),
                            style: AppTextStyles.loraRegularHeadline.copyWith(
                              fontSize: 28,
                            ),
                          ),
                          const Gap(4),
                          SvgPicture.asset(
                            'assets/svg/star.svg',
                            height: 12,
                            width: 12,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const Gap(24),
              divider,
              const Gap(24),

              // TODO: fix
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '42 reviews',
                  style: AppTextStyles.openRegularText,
                ),
              ),
              const Gap(24),
              // list view-like
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: UserReviewCard(),
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
final class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final star = SvgPicture.asset('assets/svg/star.svg');
    final rating = 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            for (int counter = 0; counter < rating.toInt(); counter = counter + 1) star,
          ],
        ),
        const Gap(8),
        //TODO: fix
        const Text('user review data long text'),
        const Gap(8),

        //TODO: fix
        const Row(
          children: [
            CircleAvatar(
              child: ColoredBox(color: Colors.red),
            ),
            Gap(8),
            Text('User name'),
          ],
        ),
      ],
    );
  }
}
