// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yelp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$YelpState {
  RestaurantQueryResult? get restaurantsData =>
      throw _privateConstructorUsedError;
  List<Restaurant> get favoriteRestaurants =>
      throw _privateConstructorUsedError;
  bool get isGettingData => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $YelpStateCopyWith<YelpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YelpStateCopyWith<$Res> {
  factory $YelpStateCopyWith(YelpState value, $Res Function(YelpState) then) =
      _$YelpStateCopyWithImpl<$Res, YelpState>;
  @useResult
  $Res call(
      {RestaurantQueryResult? restaurantsData,
      List<Restaurant> favoriteRestaurants,
      bool isGettingData,
      String errorMessage});
}

/// @nodoc
class _$YelpStateCopyWithImpl<$Res, $Val extends YelpState>
    implements $YelpStateCopyWith<$Res> {
  _$YelpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantsData = freezed,
    Object? favoriteRestaurants = null,
    Object? isGettingData = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      restaurantsData: freezed == restaurantsData
          ? _value.restaurantsData
          : restaurantsData // ignore: cast_nullable_to_non_nullable
              as RestaurantQueryResult?,
      favoriteRestaurants: null == favoriteRestaurants
          ? _value.favoriteRestaurants
          : favoriteRestaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      isGettingData: null == isGettingData
          ? _value.isGettingData
          : isGettingData // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_YelpStateCopyWith<$Res> implements $YelpStateCopyWith<$Res> {
  factory _$$_YelpStateCopyWith(
          _$_YelpState value, $Res Function(_$_YelpState) then) =
      __$$_YelpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RestaurantQueryResult? restaurantsData,
      List<Restaurant> favoriteRestaurants,
      bool isGettingData,
      String errorMessage});
}

/// @nodoc
class __$$_YelpStateCopyWithImpl<$Res>
    extends _$YelpStateCopyWithImpl<$Res, _$_YelpState>
    implements _$$_YelpStateCopyWith<$Res> {
  __$$_YelpStateCopyWithImpl(
      _$_YelpState _value, $Res Function(_$_YelpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantsData = freezed,
    Object? favoriteRestaurants = null,
    Object? isGettingData = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_YelpState(
      restaurantsData: freezed == restaurantsData
          ? _value.restaurantsData
          : restaurantsData // ignore: cast_nullable_to_non_nullable
              as RestaurantQueryResult?,
      favoriteRestaurants: null == favoriteRestaurants
          ? _value._favoriteRestaurants
          : favoriteRestaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      isGettingData: null == isGettingData
          ? _value.isGettingData
          : isGettingData // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_YelpState implements _YelpState {
  const _$_YelpState(
      {required this.restaurantsData,
      required final List<Restaurant> favoriteRestaurants,
      required this.isGettingData,
      required this.errorMessage})
      : _favoriteRestaurants = favoriteRestaurants;

  @override
  final RestaurantQueryResult? restaurantsData;
  final List<Restaurant> _favoriteRestaurants;
  @override
  List<Restaurant> get favoriteRestaurants {
    if (_favoriteRestaurants is EqualUnmodifiableListView)
      return _favoriteRestaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteRestaurants);
  }

  @override
  final bool isGettingData;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'YelpState(restaurantsData: $restaurantsData, favoriteRestaurants: $favoriteRestaurants, isGettingData: $isGettingData, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_YelpState &&
            (identical(other.restaurantsData, restaurantsData) ||
                other.restaurantsData == restaurantsData) &&
            const DeepCollectionEquality()
                .equals(other._favoriteRestaurants, _favoriteRestaurants) &&
            (identical(other.isGettingData, isGettingData) ||
                other.isGettingData == isGettingData) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      restaurantsData,
      const DeepCollectionEquality().hash(_favoriteRestaurants),
      isGettingData,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_YelpStateCopyWith<_$_YelpState> get copyWith =>
      __$$_YelpStateCopyWithImpl<_$_YelpState>(this, _$identity);
}

abstract class _YelpState implements YelpState {
  const factory _YelpState(
      {required final RestaurantQueryResult? restaurantsData,
      required final List<Restaurant> favoriteRestaurants,
      required final bool isGettingData,
      required final String errorMessage}) = _$_YelpState;

  @override
  RestaurantQueryResult? get restaurantsData;
  @override
  List<Restaurant> get favoriteRestaurants;
  @override
  bool get isGettingData;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_YelpStateCopyWith<_$_YelpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$YelpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRestaurantsData,
    required TResult Function(Restaurant restaurant) addFavoriteRestaurant,
    required TResult Function(String id) removeFavoriteRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRestaurantsData,
    TResult? Function(Restaurant restaurant)? addFavoriteRestaurant,
    TResult? Function(String id)? removeFavoriteRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRestaurantsData,
    TResult Function(Restaurant restaurant)? addFavoriteRestaurant,
    TResult Function(String id)? removeFavoriteRestaurant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRestaurantsData value) getRestaurantsData,
    required TResult Function(AddFavoriteRestaurant value)
        addFavoriteRestaurant,
    required TResult Function(RemoveFavoriteRestaurant value)
        removeFavoriteRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRestaurantsData value)? getRestaurantsData,
    TResult? Function(AddFavoriteRestaurant value)? addFavoriteRestaurant,
    TResult? Function(RemoveFavoriteRestaurant value)? removeFavoriteRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRestaurantsData value)? getRestaurantsData,
    TResult Function(AddFavoriteRestaurant value)? addFavoriteRestaurant,
    TResult Function(RemoveFavoriteRestaurant value)? removeFavoriteRestaurant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YelpEventCopyWith<$Res> {
  factory $YelpEventCopyWith(YelpEvent value, $Res Function(YelpEvent) then) =
      _$YelpEventCopyWithImpl<$Res, YelpEvent>;
}

/// @nodoc
class _$YelpEventCopyWithImpl<$Res, $Val extends YelpEvent>
    implements $YelpEventCopyWith<$Res> {
  _$YelpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetRestaurantsDataCopyWith<$Res> {
  factory _$$GetRestaurantsDataCopyWith(_$GetRestaurantsData value,
          $Res Function(_$GetRestaurantsData) then) =
      __$$GetRestaurantsDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetRestaurantsDataCopyWithImpl<$Res>
    extends _$YelpEventCopyWithImpl<$Res, _$GetRestaurantsData>
    implements _$$GetRestaurantsDataCopyWith<$Res> {
  __$$GetRestaurantsDataCopyWithImpl(
      _$GetRestaurantsData _value, $Res Function(_$GetRestaurantsData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetRestaurantsData implements GetRestaurantsData {
  const _$GetRestaurantsData();

  @override
  String toString() {
    return 'YelpEvent.getRestaurantsData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetRestaurantsData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRestaurantsData,
    required TResult Function(Restaurant restaurant) addFavoriteRestaurant,
    required TResult Function(String id) removeFavoriteRestaurant,
  }) {
    return getRestaurantsData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRestaurantsData,
    TResult? Function(Restaurant restaurant)? addFavoriteRestaurant,
    TResult? Function(String id)? removeFavoriteRestaurant,
  }) {
    return getRestaurantsData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRestaurantsData,
    TResult Function(Restaurant restaurant)? addFavoriteRestaurant,
    TResult Function(String id)? removeFavoriteRestaurant,
    required TResult orElse(),
  }) {
    if (getRestaurantsData != null) {
      return getRestaurantsData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRestaurantsData value) getRestaurantsData,
    required TResult Function(AddFavoriteRestaurant value)
        addFavoriteRestaurant,
    required TResult Function(RemoveFavoriteRestaurant value)
        removeFavoriteRestaurant,
  }) {
    return getRestaurantsData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRestaurantsData value)? getRestaurantsData,
    TResult? Function(AddFavoriteRestaurant value)? addFavoriteRestaurant,
    TResult? Function(RemoveFavoriteRestaurant value)? removeFavoriteRestaurant,
  }) {
    return getRestaurantsData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRestaurantsData value)? getRestaurantsData,
    TResult Function(AddFavoriteRestaurant value)? addFavoriteRestaurant,
    TResult Function(RemoveFavoriteRestaurant value)? removeFavoriteRestaurant,
    required TResult orElse(),
  }) {
    if (getRestaurantsData != null) {
      return getRestaurantsData(this);
    }
    return orElse();
  }
}

abstract class GetRestaurantsData implements YelpEvent {
  const factory GetRestaurantsData() = _$GetRestaurantsData;
}

/// @nodoc
abstract class _$$AddFavoriteRestaurantCopyWith<$Res> {
  factory _$$AddFavoriteRestaurantCopyWith(_$AddFavoriteRestaurant value,
          $Res Function(_$AddFavoriteRestaurant) then) =
      __$$AddFavoriteRestaurantCopyWithImpl<$Res>;
  @useResult
  $Res call({Restaurant restaurant});
}

/// @nodoc
class __$$AddFavoriteRestaurantCopyWithImpl<$Res>
    extends _$YelpEventCopyWithImpl<$Res, _$AddFavoriteRestaurant>
    implements _$$AddFavoriteRestaurantCopyWith<$Res> {
  __$$AddFavoriteRestaurantCopyWithImpl(_$AddFavoriteRestaurant _value,
      $Res Function(_$AddFavoriteRestaurant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurant = null,
  }) {
    return _then(_$AddFavoriteRestaurant(
      null == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant,
    ));
  }
}

/// @nodoc

class _$AddFavoriteRestaurant implements AddFavoriteRestaurant {
  const _$AddFavoriteRestaurant(this.restaurant);

  @override
  final Restaurant restaurant;

  @override
  String toString() {
    return 'YelpEvent.addFavoriteRestaurant(restaurant: $restaurant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFavoriteRestaurant &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, restaurant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFavoriteRestaurantCopyWith<_$AddFavoriteRestaurant> get copyWith =>
      __$$AddFavoriteRestaurantCopyWithImpl<_$AddFavoriteRestaurant>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRestaurantsData,
    required TResult Function(Restaurant restaurant) addFavoriteRestaurant,
    required TResult Function(String id) removeFavoriteRestaurant,
  }) {
    return addFavoriteRestaurant(restaurant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRestaurantsData,
    TResult? Function(Restaurant restaurant)? addFavoriteRestaurant,
    TResult? Function(String id)? removeFavoriteRestaurant,
  }) {
    return addFavoriteRestaurant?.call(restaurant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRestaurantsData,
    TResult Function(Restaurant restaurant)? addFavoriteRestaurant,
    TResult Function(String id)? removeFavoriteRestaurant,
    required TResult orElse(),
  }) {
    if (addFavoriteRestaurant != null) {
      return addFavoriteRestaurant(restaurant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRestaurantsData value) getRestaurantsData,
    required TResult Function(AddFavoriteRestaurant value)
        addFavoriteRestaurant,
    required TResult Function(RemoveFavoriteRestaurant value)
        removeFavoriteRestaurant,
  }) {
    return addFavoriteRestaurant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRestaurantsData value)? getRestaurantsData,
    TResult? Function(AddFavoriteRestaurant value)? addFavoriteRestaurant,
    TResult? Function(RemoveFavoriteRestaurant value)? removeFavoriteRestaurant,
  }) {
    return addFavoriteRestaurant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRestaurantsData value)? getRestaurantsData,
    TResult Function(AddFavoriteRestaurant value)? addFavoriteRestaurant,
    TResult Function(RemoveFavoriteRestaurant value)? removeFavoriteRestaurant,
    required TResult orElse(),
  }) {
    if (addFavoriteRestaurant != null) {
      return addFavoriteRestaurant(this);
    }
    return orElse();
  }
}

abstract class AddFavoriteRestaurant implements YelpEvent {
  const factory AddFavoriteRestaurant(final Restaurant restaurant) =
      _$AddFavoriteRestaurant;

  Restaurant get restaurant;
  @JsonKey(ignore: true)
  _$$AddFavoriteRestaurantCopyWith<_$AddFavoriteRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFavoriteRestaurantCopyWith<$Res> {
  factory _$$RemoveFavoriteRestaurantCopyWith(_$RemoveFavoriteRestaurant value,
          $Res Function(_$RemoveFavoriteRestaurant) then) =
      __$$RemoveFavoriteRestaurantCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RemoveFavoriteRestaurantCopyWithImpl<$Res>
    extends _$YelpEventCopyWithImpl<$Res, _$RemoveFavoriteRestaurant>
    implements _$$RemoveFavoriteRestaurantCopyWith<$Res> {
  __$$RemoveFavoriteRestaurantCopyWithImpl(_$RemoveFavoriteRestaurant _value,
      $Res Function(_$RemoveFavoriteRestaurant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemoveFavoriteRestaurant(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveFavoriteRestaurant implements RemoveFavoriteRestaurant {
  const _$RemoveFavoriteRestaurant(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'YelpEvent.removeFavoriteRestaurant(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFavoriteRestaurant &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFavoriteRestaurantCopyWith<_$RemoveFavoriteRestaurant>
      get copyWith =>
          __$$RemoveFavoriteRestaurantCopyWithImpl<_$RemoveFavoriteRestaurant>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRestaurantsData,
    required TResult Function(Restaurant restaurant) addFavoriteRestaurant,
    required TResult Function(String id) removeFavoriteRestaurant,
  }) {
    return removeFavoriteRestaurant(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRestaurantsData,
    TResult? Function(Restaurant restaurant)? addFavoriteRestaurant,
    TResult? Function(String id)? removeFavoriteRestaurant,
  }) {
    return removeFavoriteRestaurant?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRestaurantsData,
    TResult Function(Restaurant restaurant)? addFavoriteRestaurant,
    TResult Function(String id)? removeFavoriteRestaurant,
    required TResult orElse(),
  }) {
    if (removeFavoriteRestaurant != null) {
      return removeFavoriteRestaurant(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRestaurantsData value) getRestaurantsData,
    required TResult Function(AddFavoriteRestaurant value)
        addFavoriteRestaurant,
    required TResult Function(RemoveFavoriteRestaurant value)
        removeFavoriteRestaurant,
  }) {
    return removeFavoriteRestaurant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRestaurantsData value)? getRestaurantsData,
    TResult? Function(AddFavoriteRestaurant value)? addFavoriteRestaurant,
    TResult? Function(RemoveFavoriteRestaurant value)? removeFavoriteRestaurant,
  }) {
    return removeFavoriteRestaurant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRestaurantsData value)? getRestaurantsData,
    TResult Function(AddFavoriteRestaurant value)? addFavoriteRestaurant,
    TResult Function(RemoveFavoriteRestaurant value)? removeFavoriteRestaurant,
    required TResult orElse(),
  }) {
    if (removeFavoriteRestaurant != null) {
      return removeFavoriteRestaurant(this);
    }
    return orElse();
  }
}

abstract class RemoveFavoriteRestaurant implements YelpEvent {
  const factory RemoveFavoriteRestaurant(final String id) =
      _$RemoveFavoriteRestaurant;

  String get id;
  @JsonKey(ignore: true)
  _$$RemoveFavoriteRestaurantCopyWith<_$RemoveFavoriteRestaurant>
      get copyWith => throw _privateConstructorUsedError;
}
