import 'package:flutter/material.dart';

import 'package:restaurant_tour/design_system/design_system.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      padding: const EdgeInsets.symmetric(
        vertical: DsSizes.md,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(
            vertical: DsSizes.xxxs,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DsRating(
                initialRating: 3,
                itemCount: 5,
              ),
              SizedBox(height: DsSizes.xxxs),
              DsText(
                'Const class cannot remove fields: Library:package:restaurant_tour/modules/home/widgets/image_network_loading.dart Class: ImageNetworkLoading. Try performing a hot restart instead.',
              ),
              SizedBox(height: DsSizes.xxxs),
              UserAvatar(name: 'User Name test'),
            ],
          ),
        );
      },
    );
  }
}
