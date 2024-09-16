// Mocks generated by Mockito 5.4.4 from annotations
// in restaurant_tour/test/presentation/favorites/test_favorite_restaurants_bloc.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:restaurant_tour/domain/usecase/restaurants_usecase.dart' as _i3;
import 'package:restaurant_tour/models/restaurant.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRestaurant_0 extends _i1.SmartFake implements _i2.Restaurant {
  _FakeRestaurant_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RestaurantsUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockRestaurantsUsecase extends _i1.Mock
    implements _i3.RestaurantsUsecase {
  @override
  _i4.Future<List<_i2.Restaurant>> getRestaurants() => (super.noSuchMethod(
        Invocation.method(
          #getRestaurants,
          [],
        ),
        returnValue: _i4.Future<List<_i2.Restaurant>>.value(<_i2.Restaurant>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.Restaurant>>.value(<_i2.Restaurant>[]),
      ) as _i4.Future<List<_i2.Restaurant>>);

  @override
  _i4.Future<List<_i2.Restaurant>> getFavoriteRestaurants() =>
      (super.noSuchMethod(
        Invocation.method(
          #getFavoriteRestaurants,
          [],
        ),
        returnValue: _i4.Future<List<_i2.Restaurant>>.value(<_i2.Restaurant>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.Restaurant>>.value(<_i2.Restaurant>[]),
      ) as _i4.Future<List<_i2.Restaurant>>);

  @override
  _i4.Future<_i2.Restaurant> getRestaurant(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getRestaurant,
          [id],
        ),
        returnValue: _i4.Future<_i2.Restaurant>.value(_FakeRestaurant_0(
          this,
          Invocation.method(
            #getRestaurant,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Restaurant>.value(_FakeRestaurant_0(
          this,
          Invocation.method(
            #getRestaurant,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Restaurant>);

  @override
  _i4.Future<void> addFavoriteRestaurant(_i2.Restaurant? restaurant) =>
      (super.noSuchMethod(
        Invocation.method(
          #addFavoriteRestaurant,
          [restaurant],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> removeFavoriteRestaurant(_i2.Restaurant? restaurant) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeFavoriteRestaurant,
          [restaurant],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
