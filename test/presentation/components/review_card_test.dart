import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:restaurant_tour/presentation/components/review_card.dart';
import '../../fakes/data/fake_restaurant.dart';
import '../../make_testable_widget.dart';

void main() {
  testWidgets('ReviewCard should render correctly', (tester) async {
    final review = fakeRestaurant.toDomain().reviews!.first;

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        makeTestableWidget(
          child: ReviewCard(
            review: review,
          ),
        ),
      ),
    );

    expect(find.byType(ReviewCard), findsOneWidget);
  });
}
