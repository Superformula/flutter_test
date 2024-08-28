import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/cubit.dart';

void main() {
  group(
    RestaurantTourCubit,
    () {
      late Storage storage;
      late RestaurantTourCubit cubit;

      setUp(() {
        storage = MockStorage();

        when(
          () => storage.write(any(), any<dynamic>()),
        ).thenAnswer((invocation) async {});

        HydratedBloc.storage = storage;

        cubit = RestaurantTourCubit();
      });

      test('initial state should be an empty list', () {
        expect(cubit.state, []);
      });

      blocTest(
        '.favorite should emit a set with the new element included',
        build: () => cubit,
        act: (cubit) {
          cubit.favorite('a');
          cubit.favorite('b');
        },
        expect: () => [
          {'a'},
          {'a', 'b'},
        ],
      );

      blocTest(
        '.unfavorite should emit a set without without the element being unfavorited',
        build: () => cubit,
        seed: () => {'a', 'b'},
        act: (cubit) {
          cubit.unfavorite('a');
          cubit.unfavorite('b');
        },
        expect: () => <Set<String>>[
          {'b'},
          {},
        ],
      );

      blocTest(
        '.favorite should emit the same state if the favorited element is already favorited',
        build: () => cubit,
        seed: () => {'a', 'b'},
        act: (cubit) {
          cubit.favorite('a');
          cubit.favorite('b');
        },
        expect: () => [
          {'a', 'b'},
          {'a', 'b'},
        ],
      );

      blocTest(
        '.unfavorite should emit the same state if the unfavorited element is not favorited',
        build: () => cubit,
        seed: () => {'c'},
        act: (cubit) {
          cubit.unfavorite('a');
          cubit.unfavorite('b');
        },
        expect: () => [
          {'c'},
          {'c'},
        ],
      );

      blocTest(
        '.toggleFavorite should emit a set with the element being toggled when it is not favorited and a set without it when it is already favorited',
        build: () => cubit,
        seed: () => {'c'},
        act: (cubit) {
          cubit.toggleFavorite('a');
          cubit.toggleFavorite('b');
          cubit.toggleFavorite('b');
          cubit.toggleFavorite('c');
        },
        expect: () => [
          {'c', 'a'},
          {'c', 'a', 'b'},
          {'c', 'a'},
          {'a'},
        ],
      );

      test(
        '.favorited should return whether an element is favorited or not',
        () {
          cubit.favorite('a');
          cubit.favorite('c');
          cubit.toggleFavorite('d');
          cubit.unfavorite('d');

          expect(cubit.favorited('a'), true);
          expect(cubit.favorited('b'), false);
          expect(cubit.favorited('c'), true);
          expect(cubit.favorited('d'), false);
        },
      );
    },
  );
}

class MockStorage extends Mock implements Storage {}
