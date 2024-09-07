import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
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
  @override
  Widget build(BuildContext context) {
    //const divider = Divider(color: Color(0xffeeeeee), height: 1, thickness: 1);
    const divider = Divider(color: Colors.black, height: 1, thickness: 1);
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
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image here
              Row(
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
              const Gap(24),
              divider,
              Column(
                children: [
                  const Gap(24),
                  const Text('Address'),
                  const Gap(24),
                  // TODO: fix
                  if (restaurant.location?.formattedAddress case final address?) //
                    Text(address),
                ],
              ),
              const Gap(24),
              divider,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(24),
                  const Text('Overall Rating'),
                  const Gap(16),
                  // TODO: fix
                  if (restaurant.rating case final rating?) //
                    Row(
                      children: [
                        Text(rating.toString()),
                        const Gap(4),
                        SvgPicture.asset('assets/svg/star.svg'),
                      ],
                    ),
                ],
              ),
              const Gap(24),
              divider,
              const Gap(24),

              // TODO: fix
              const Text('42 reviews'),
              const Gap(24),
              const UserReviewCard(),
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
