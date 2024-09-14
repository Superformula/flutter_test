part of '../restaurant_tour_page.dart';

class _Image extends StatelessWidget {
  final String _url;

  const _Image(this._url);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 88,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(_url),
    );
  }
}
