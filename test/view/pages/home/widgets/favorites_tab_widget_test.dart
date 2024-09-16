import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:restaurant_tour/view/cubit/favorite/favorite.dart';
import 'package:restaurant_tour/view/pages/favorites/favorites_page.dart';
import 'package:restaurant_tour/view/pages/home/widgets/favorites_tab_widget.dart';

class MockFavoriteCubit extends MockCubit<FavoriteState>
    implements FavoriteCubit {}

late FavoriteCubit favoriteCubit;

void main() {
  setUp(
    () => favoriteCubit = MockFavoriteCubit(),
  );

  tearDown(
    () => favoriteCubit.close(),
  );

  testWidgets('Find favorites restaurants inital state', (tester) async {
    when(() => favoriteCubit.state)
        .thenReturn(FavoriteState(status: FavoriteStatus.initial));

    await _createWidget(tester);

    expect(
      find.text('You have not added any favorite resaturants!'),
      findsOneWidget,
    );
  });

  testWidgets('Find favorites restaurants loading state', (tester) async {
    when(() => favoriteCubit.state)
        .thenReturn(FavoriteState(status: FavoriteStatus.loading));

    await _createWidget(tester);

    expect(
      find.byType(CircularProgressIndicator),
      findsOneWidget,
    );
  });

  testWidgets('Find restaurants success state', (tester) async {
    when(() => favoriteCubit.state)
        .thenReturn(FavoriteState(status: FavoriteStatus.success));

    await _createWidget(tester);

    await mockNetworkImages(() async => _createWidget(tester));

    expect(find.byType(FavoritesListBuilder), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider.value(
        value: favoriteCubit,
        child: const FavoritesTabWidget(),
      ),
    ),
  );
}
