part of '../restaurant_detail_page.dart';

class _ReviewList extends StatelessWidget {
  final List<ReviewEntity> _reviews;

  const _ReviewList(this._reviews);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${_reviews.length} reviews', style: AppTextStyles.openRegularText),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _reviews.length,
          itemBuilder: (context, index) {
            final review = _reviews[index];
            return _ReviewItem(review);
          },
        ),
      ],
    );
  }
}
