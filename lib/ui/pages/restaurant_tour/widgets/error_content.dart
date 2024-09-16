part of '../restaurant_tour_page.dart';

class _ErrorContent extends StatelessWidget {
  final String message;

  const _ErrorContent(
    this.message,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTextStyles.openRegularHeadline,
        textAlign: TextAlign.center,
      ),
    );
  }
}
