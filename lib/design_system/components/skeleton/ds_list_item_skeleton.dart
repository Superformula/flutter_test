import 'package:flutter/material.dart';

import 'package:restaurant_tour/design_system/components/skeleton/skeleton.dart';
import 'package:restaurant_tour/design_system/tokens/tokens.dart';

class DsListItemSkeleton extends StatelessWidget {
  const DsListItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          const DsImageSkeleton(),
          const SizedBox(width: DsSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DsLineSkeleton(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                ),
                const SizedBox(height: DsSizes.md),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DsLineSkeleton(width: 100),
                    DsLineSkeleton(width: 100),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
