import 'package:flutter/material.dart';

class MyFavoritiesTab extends StatefulWidget {
  const MyFavoritiesTab({
    super.key,
  });

  @override
  State<MyFavoritiesTab> createState() => _MyFavoritiesTabState();
}

DateTime selectedDate = DateTime.now();

class _MyFavoritiesTabState extends State<MyFavoritiesTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
