import 'package:flutter/material.dart';

class DetailDivider extends StatelessWidget {
  const DetailDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Divider(
        thickness: 1.0,
        color: Color(0xffEEEEEE),
      ),
    );
  }
}
