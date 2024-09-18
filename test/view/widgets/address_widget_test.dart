import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/view/widgets/address_widget.dart';

void main() {
  testWidgets('AddressWidget displays address correctly',
      (WidgetTester tester) async {
    // Test with a provided address
    const address = '123 Main St, Anytown, CA';
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AddressWidget(address: address),
        ),
      ),
    );

    expect(find.text(address), findsOneWidget);

    // Test with a null address
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AddressWidget(address: null),
        ),
      ),
    );

    expect(find.text('Address info'), findsOneWidget);
  });
}
