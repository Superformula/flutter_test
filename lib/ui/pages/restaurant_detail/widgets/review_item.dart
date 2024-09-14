part of '../restaurant_detail_page.dart';

class _ReviewItem extends StatelessWidget {
  const _ReviewItem();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Stars(4),
        SizedBox(height: 8),
        Text(
          'Review text goes here. Review text goes here. This is a review. This is a review that is 3 lines long.',
          style: AppTextStyles.openRegularHeadline,
        ),
        SizedBox(height: 8),
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
              ),
            ),
            SizedBox(width: 8),
            Text('User Name', style: AppTextStyles.openRegularText),
          ],
        ),
        _Divider(verticalPadding: 16),
      ],
    );
  }
}
