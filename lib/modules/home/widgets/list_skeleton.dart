import 'package:flutter/material.dart';

import 'package:restaurant_tour/design_system/components/components.dart';

class ListSkeleton extends StatelessWidget {
  const ListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => const DsListItemSkeleton(),
    );
  }
}
