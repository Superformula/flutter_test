part of '../restaurant_detail_page.dart';

class _Rating extends StatelessWidget {
  final String _rating;

  const _Rating(this._rating);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          _rating,
          style: AppTextStyles.loraRegularHeadline.copyWith(fontSize: 28),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: StarIcon(),
        ),
      ],
    );
  }
}
