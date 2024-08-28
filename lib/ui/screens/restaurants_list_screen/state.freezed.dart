// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RestaurantsListScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Restaurant> restaurants) data,
    required TResult Function(Exception exception, StackTrace? stackTrace)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Restaurant> restaurants)? data,
    TResult? Function(Exception exception, StackTrace? stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Restaurant> restaurants)? data,
    TResult Function(Exception exception, StackTrace? stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingRestaurants value) loading,
    required TResult Function(RestaurantsData value) data,
    required TResult Function(RestaurantsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingRestaurants value)? loading,
    TResult? Function(RestaurantsData value)? data,
    TResult? Function(RestaurantsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingRestaurants value)? loading,
    TResult Function(RestaurantsData value)? data,
    TResult Function(RestaurantsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantsListScreenStateCopyWith<$Res> {
  factory $RestaurantsListScreenStateCopyWith(RestaurantsListScreenState value,
          $Res Function(RestaurantsListScreenState) then) =
      _$RestaurantsListScreenStateCopyWithImpl<$Res,
          RestaurantsListScreenState>;
}

/// @nodoc
class _$RestaurantsListScreenStateCopyWithImpl<$Res,
        $Val extends RestaurantsListScreenState>
    implements $RestaurantsListScreenStateCopyWith<$Res> {
  _$RestaurantsListScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingRestaurantsImplCopyWith<$Res> {
  factory _$$LoadingRestaurantsImplCopyWith(_$LoadingRestaurantsImpl value,
          $Res Function(_$LoadingRestaurantsImpl) then) =
      __$$LoadingRestaurantsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingRestaurantsImplCopyWithImpl<$Res>
    extends _$RestaurantsListScreenStateCopyWithImpl<$Res,
        _$LoadingRestaurantsImpl>
    implements _$$LoadingRestaurantsImplCopyWith<$Res> {
  __$$LoadingRestaurantsImplCopyWithImpl(_$LoadingRestaurantsImpl _value,
      $Res Function(_$LoadingRestaurantsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingRestaurantsImpl implements LoadingRestaurants {
  const _$LoadingRestaurantsImpl();

  @override
  String toString() {
    return 'RestaurantsListScreenState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingRestaurantsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Restaurant> restaurants) data,
    required TResult Function(Exception exception, StackTrace? stackTrace)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Restaurant> restaurants)? data,
    TResult? Function(Exception exception, StackTrace? stackTrace)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Restaurant> restaurants)? data,
    TResult Function(Exception exception, StackTrace? stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingRestaurants value) loading,
    required TResult Function(RestaurantsData value) data,
    required TResult Function(RestaurantsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingRestaurants value)? loading,
    TResult? Function(RestaurantsData value)? data,
    TResult? Function(RestaurantsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingRestaurants value)? loading,
    TResult Function(RestaurantsData value)? data,
    TResult Function(RestaurantsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingRestaurants implements RestaurantsListScreenState {
  const factory LoadingRestaurants() = _$LoadingRestaurantsImpl;
}

/// @nodoc
abstract class _$$RestaurantsDataImplCopyWith<$Res> {
  factory _$$RestaurantsDataImplCopyWith(_$RestaurantsDataImpl value,
          $Res Function(_$RestaurantsDataImpl) then) =
      __$$RestaurantsDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Restaurant> restaurants});
}

/// @nodoc
class __$$RestaurantsDataImplCopyWithImpl<$Res>
    extends _$RestaurantsListScreenStateCopyWithImpl<$Res,
        _$RestaurantsDataImpl> implements _$$RestaurantsDataImplCopyWith<$Res> {
  __$$RestaurantsDataImplCopyWithImpl(
      _$RestaurantsDataImpl _value, $Res Function(_$RestaurantsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurants = null,
  }) {
    return _then(_$RestaurantsDataImpl(
      restaurants: null == restaurants
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
    ));
  }
}

/// @nodoc

class _$RestaurantsDataImpl implements RestaurantsData {
  const _$RestaurantsDataImpl({final List<Restaurant> restaurants = const []})
      : _restaurants = restaurants;

  final List<Restaurant> _restaurants;
  @override
  @JsonKey()
  List<Restaurant> get restaurants {
    if (_restaurants is EqualUnmodifiableListView) return _restaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  @override
  String toString() {
    return 'RestaurantsListScreenState.data(restaurants: $restaurants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantsDataImpl &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_restaurants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantsDataImplCopyWith<_$RestaurantsDataImpl> get copyWith =>
      __$$RestaurantsDataImplCopyWithImpl<_$RestaurantsDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Restaurant> restaurants) data,
    required TResult Function(Exception exception, StackTrace? stackTrace)
        error,
  }) {
    return data(restaurants);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Restaurant> restaurants)? data,
    TResult? Function(Exception exception, StackTrace? stackTrace)? error,
  }) {
    return data?.call(restaurants);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Restaurant> restaurants)? data,
    TResult Function(Exception exception, StackTrace? stackTrace)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(restaurants);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingRestaurants value) loading,
    required TResult Function(RestaurantsData value) data,
    required TResult Function(RestaurantsError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingRestaurants value)? loading,
    TResult? Function(RestaurantsData value)? data,
    TResult? Function(RestaurantsError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingRestaurants value)? loading,
    TResult Function(RestaurantsData value)? data,
    TResult Function(RestaurantsError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class RestaurantsData implements RestaurantsListScreenState {
  const factory RestaurantsData({final List<Restaurant> restaurants}) =
      _$RestaurantsDataImpl;

  List<Restaurant> get restaurants;
  @JsonKey(ignore: true)
  _$$RestaurantsDataImplCopyWith<_$RestaurantsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestaurantsErrorImplCopyWith<$Res> {
  factory _$$RestaurantsErrorImplCopyWith(_$RestaurantsErrorImpl value,
          $Res Function(_$RestaurantsErrorImpl) then) =
      __$$RestaurantsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception exception, StackTrace? stackTrace});
}

/// @nodoc
class __$$RestaurantsErrorImplCopyWithImpl<$Res>
    extends _$RestaurantsListScreenStateCopyWithImpl<$Res,
        _$RestaurantsErrorImpl>
    implements _$$RestaurantsErrorImplCopyWith<$Res> {
  __$$RestaurantsErrorImplCopyWithImpl(_$RestaurantsErrorImpl _value,
      $Res Function(_$RestaurantsErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
    Object? stackTrace = freezed,
  }) {
    return _then(_$RestaurantsErrorImpl(
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$RestaurantsErrorImpl implements RestaurantsError {
  const _$RestaurantsErrorImpl({required this.exception, this.stackTrace});

  @override
  final Exception exception;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'RestaurantsListScreenState.error(exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantsErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantsErrorImplCopyWith<_$RestaurantsErrorImpl> get copyWith =>
      __$$RestaurantsErrorImplCopyWithImpl<_$RestaurantsErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Restaurant> restaurants) data,
    required TResult Function(Exception exception, StackTrace? stackTrace)
        error,
  }) {
    return error(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Restaurant> restaurants)? data,
    TResult? Function(Exception exception, StackTrace? stackTrace)? error,
  }) {
    return error?.call(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Restaurant> restaurants)? data,
    TResult Function(Exception exception, StackTrace? stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingRestaurants value) loading,
    required TResult Function(RestaurantsData value) data,
    required TResult Function(RestaurantsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingRestaurants value)? loading,
    TResult? Function(RestaurantsData value)? data,
    TResult? Function(RestaurantsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingRestaurants value)? loading,
    TResult Function(RestaurantsData value)? data,
    TResult Function(RestaurantsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RestaurantsError implements RestaurantsListScreenState {
  const factory RestaurantsError(
      {required final Exception exception,
      final StackTrace? stackTrace}) = _$RestaurantsErrorImpl;

  Exception get exception;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$RestaurantsErrorImplCopyWith<_$RestaurantsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
