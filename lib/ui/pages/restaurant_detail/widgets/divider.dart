part of '../restaurant_detail_page.dart';

class _Divider extends StatelessWidget {
  final double verticalPadding;

  const _Divider({this.verticalPadding = 24});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: const Divider(color: Color(0xFFEEEEEE)),
    );
  }
}
