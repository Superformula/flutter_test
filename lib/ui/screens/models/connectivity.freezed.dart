// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connectivity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Connectivity {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connected,
    required TResult Function() disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connected,
    TResult? Function()? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectivityConnected value) connected,
    required TResult Function(ConnectivityDisConnected value) disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectivityConnected value)? connected,
    TResult? Function(ConnectivityDisConnected value)? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectivityConnected value)? connected,
    TResult Function(ConnectivityDisConnected value)? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityCopyWith<$Res> {
  factory $ConnectivityCopyWith(
          Connectivity value, $Res Function(Connectivity) then) =
      _$ConnectivityCopyWithImpl<$Res, Connectivity>;
}

/// @nodoc
class _$ConnectivityCopyWithImpl<$Res, $Val extends Connectivity>
    implements $ConnectivityCopyWith<$Res> {
  _$ConnectivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Connectivity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectivityConnectedImplCopyWith<$Res> {
  factory _$$ConnectivityConnectedImplCopyWith(
          _$ConnectivityConnectedImpl value,
          $Res Function(_$ConnectivityConnectedImpl) then) =
      __$$ConnectivityConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectivityConnectedImplCopyWithImpl<$Res>
    extends _$ConnectivityCopyWithImpl<$Res, _$ConnectivityConnectedImpl>
    implements _$$ConnectivityConnectedImplCopyWith<$Res> {
  __$$ConnectivityConnectedImplCopyWithImpl(_$ConnectivityConnectedImpl _value,
      $Res Function(_$ConnectivityConnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Connectivity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectivityConnectedImpl implements ConnectivityConnected {
  const _$ConnectivityConnectedImpl();

  @override
  String toString() {
    return 'Connectivity.connected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectivityConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connected,
    required TResult Function() disconnected,
  }) {
    return connected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connected,
    TResult? Function()? disconnected,
  }) {
    return connected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectivityConnected value) connected,
    required TResult Function(ConnectivityDisConnected value) disconnected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectivityConnected value)? connected,
    TResult? Function(ConnectivityDisConnected value)? disconnected,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectivityConnected value)? connected,
    TResult Function(ConnectivityDisConnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class ConnectivityConnected implements Connectivity {
  const factory ConnectivityConnected() = _$ConnectivityConnectedImpl;
}

/// @nodoc
abstract class _$$ConnectivityDisConnectedImplCopyWith<$Res> {
  factory _$$ConnectivityDisConnectedImplCopyWith(
          _$ConnectivityDisConnectedImpl value,
          $Res Function(_$ConnectivityDisConnectedImpl) then) =
      __$$ConnectivityDisConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectivityDisConnectedImplCopyWithImpl<$Res>
    extends _$ConnectivityCopyWithImpl<$Res, _$ConnectivityDisConnectedImpl>
    implements _$$ConnectivityDisConnectedImplCopyWith<$Res> {
  __$$ConnectivityDisConnectedImplCopyWithImpl(
      _$ConnectivityDisConnectedImpl _value,
      $Res Function(_$ConnectivityDisConnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Connectivity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectivityDisConnectedImpl implements ConnectivityDisConnected {
  const _$ConnectivityDisConnectedImpl();

  @override
  String toString() {
    return 'Connectivity.disconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectivityDisConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connected,
    required TResult Function() disconnected,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connected,
    TResult? Function()? disconnected,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectivityConnected value) connected,
    required TResult Function(ConnectivityDisConnected value) disconnected,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectivityConnected value)? connected,
    TResult? Function(ConnectivityDisConnected value)? disconnected,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectivityConnected value)? connected,
    TResult Function(ConnectivityDisConnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class ConnectivityDisConnected implements Connectivity {
  const factory ConnectivityDisConnected() = _$ConnectivityDisConnectedImpl;
}
