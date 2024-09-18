import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class DsLineSkeleton extends StatelessWidget {
  const DsLineSkeleton({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
