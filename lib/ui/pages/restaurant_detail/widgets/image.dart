part of '../restaurant_detail_page.dart';

class _Image extends StatelessWidget {
  final List<String> _photos;

  const _Image({
    required List<String> photos,
  }) : _photos = photos;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      color: Colors.black12,
      child: _photos.isEmpty ? const NoImage() : Image.network(_photos.first, fit: BoxFit.cover),
    );
  }
}
