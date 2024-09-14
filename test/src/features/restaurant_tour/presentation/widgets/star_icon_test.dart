import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/star_icon.dart';

void main() {
  testWidgets('StarIcon renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StarIcon(),
        ),
      ),
    );

    final iconFinder = find.byType(Icon);

    expect(iconFinder, findsOneWidget);

    final Icon icon = tester.widget(iconFinder) as Icon;
    expect(icon.icon, Icons.star);
    expect(icon.color, const Color(0xffffb800));
  });
}
