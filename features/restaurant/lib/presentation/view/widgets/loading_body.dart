import 'package:flutter/material.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(height: 36, child: CircularProgressIndicator()));
  }
}
