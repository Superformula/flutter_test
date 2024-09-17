part of '../restaurant_tour_page.dart';

class _Image extends StatelessWidget {
  final String _url;

  const _Image(this._url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 88,
        width: 88,
        decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(8)),
        child: _url.isEmpty ? const NoImage(style: AppTextStyles.openRegularText) : Image.network(_url, fit: BoxFit.cover),
      ),
    );
  }
}
