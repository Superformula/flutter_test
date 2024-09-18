part of '../restaurant_detail_page.dart';

class _ReviewItem extends StatelessWidget {
  final ReviewEntity _review;

  const _ReviewItem(this._review);

  @override
  Widget build(BuildContext context) {
    final userImage = _review.user.imageUrl;
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
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black12),
                child: userImage.isEmpty ? const Icon(Icons.person) : Image.network(_review.user.imageUrl, fit: BoxFit.fill),
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
