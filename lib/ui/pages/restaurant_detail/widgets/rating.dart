part of '../restaurant_detail_page.dart';

class _Rating extends StatelessWidget {
  const _Rating();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '4.6',
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
