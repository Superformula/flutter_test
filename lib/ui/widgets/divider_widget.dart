import 'package:flutter/material.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Divider(
        thickness: 1.0,
        color: OsColors.dividerColor,
      ),
    );
  }
}
