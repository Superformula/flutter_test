import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class DsImageSkeleton extends StatelessWidget {
  const DsImageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
