part of '../restaurant_tour_page.dart';

class _MessageContent extends StatelessWidget {
  final String message;

  const _MessageContent(
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
