import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:restaurant_tour/presentation/components/rating_stars.dart';
import '../../make_testable_widget.dart';

void main() {
  testWidgets('RatingStars should render correctly with different values',
      (tester) async {
    for (var i = 1; i < 6; i++) {
      await tester.pumpWidget(
        makeTestableWidget(
          child: RatingStars(rating: i.toDouble()),
        ),
      );

      expect(find.byIcon(Icons.star), findsNWidgets(i));
    }

    await tester.pumpWidget(
      makeTestableWidget(
        child: const RatingStars(rating: 3.5),
      ),
    );

    expect(find.byIcon(Icons.star), findsNWidgets(4));

    await tester.pumpWidget(
      makeTestableWidget(
        child: const RatingStars(rating: 3.3),
      ),
    );

    expect(find.byIcon(Icons.star), findsNWidgets(3));
  });
}
