part of '../restaurant_detail_page.dart';

class _ReviewItem extends StatelessWidget {
  final ReviewEntity _review;

  const _ReviewItem(this._review);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stars(_review.rating),
        const SizedBox(height: 8),
        Text(
          _review.text,
          style: AppTextStyles.openRegularHeadline,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: CircleAvatar(
                child: Image.network(_review.user.imageUrl),
              ),
            ),
            const SizedBox(width: 8),
            Text(_review.user.name, style: AppTextStyles.openRegularText),
          ],
        ),
        const _Divider(verticalPadding: 16),
      ],
    );
  }
}
