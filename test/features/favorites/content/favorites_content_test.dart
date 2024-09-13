import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/app/app.dart';
import 'package:restaurant_tour/features/favorites/content/favorites_content.dart';

class MockStorage extends Mock implements Storage {}

class MockFavoriteCubit extends MockCubit<FavoriteState>
    implements FavoriteCubit {}

void main() {
  late FavoriteCubit favoriteCubit;
  late Storage hydratedStorage;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    hydratedStorage = MockStorage();
    when(() => hydratedStorage.write(any(), any<dynamic>()))
        .thenAnswer((_) async {});

    when(() => hydratedStorage.read(any())).thenReturn({
      'restaurants': [],
    });

    HydratedBloc.storage = hydratedStorage;
    favoriteCubit = MockFavoriteCubit();
  });

  tearDown(() {
    favoriteCubit.close();
  });

  group('favorites', () {
    testWidgets('Should Render Favorites Content', (tester) async {
      when(() => favoriteCubit.state)
          .thenReturn(FavoriteLoaded(restaurants: []));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => favoriteCubit,
            child: const FavoritesContent(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(FavoritesContent), findsOneWidget);
    });
  });

  testWidgets('Shows a list of favorites when favorites are loaded',
      (tester) async {
    when(() => favoriteCubit.state).thenReturn(
      FavoriteLoaded(
        restaurants: [const Restaurant(id: '1', name: 'Test Restaurant')],
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: favoriteCubit,
          child: const FavoritesContent(),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Test Restaurant'), findsOneWidget);
  });

  group('FavoritesContent Tests', () {
    testWidgets('Shows "No favorites" when there are no favorites',
        (tester) async {
      when(() => favoriteCubit.state)
          .thenReturn(FavoriteLoaded(restaurants: []));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: favoriteCubit,
            child: const FavoritesContent(),
          ),
        ),
      );

      expect(find.text('No favorites'), findsOneWidget);
    });

    testWidgets('Shows a list of favorites when favorites are loaded',
        (tester) async {
      when(() => favoriteCubit.state).thenReturn(
        FavoriteLoaded(
          restaurants: [const Restaurant(id: '1', name: 'Test Restaurant')],
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: favoriteCubit,
            child: const FavoritesContent(),
          ),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Test Restaurant'), findsOneWidget);
    });

    testWidgets('Shows "Failed to load favorites" on error state',
        (tester) async {
      when(() => favoriteCubit.state).thenReturn(FavoriteError());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: favoriteCubit,
            child: const FavoritesContent(),
          ),
        ),
      );

      expect(find.text('Failed to load favorites'), findsOneWidget);
    });
  });
}
