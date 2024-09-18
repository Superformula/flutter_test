part of '../restaurant_detail_page.dart';

class _ArrowBackIcon extends StatelessWidget {
  const _ArrowBackIcon();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(Icons.arrow_back),
      onTap: () => Navigator.pop(context),
    );
  }
}
