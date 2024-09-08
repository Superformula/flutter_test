// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestaurantDataQuery _$RestaurantDataQueryFromJson(Map<String, dynamic> json) {
  return _RestaurantDataQuery.fromJson(json);
}

/// @nodoc
mixin _$RestaurantDataQuery {
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'business')
  List<RestaurantData> get restaurants => throw _privateConstructorUsedError;

  /// Serializes this RestaurantDataQuery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantDataQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantDataQueryCopyWith<RestaurantDataQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDataQueryCopyWith<$Res> {
  factory $RestaurantDataQueryCopyWith(
          RestaurantDataQuery value, $Res Function(RestaurantDataQuery) then) =
      _$RestaurantDataQueryCopyWithImpl<$Res, RestaurantDataQuery>;
  @useResult
  $Res call(
      {int total, @JsonKey(name: 'business') List<RestaurantData> restaurants});
}

/// @nodoc
class _$RestaurantDataQueryCopyWithImpl<$Res, $Val extends RestaurantDataQuery>
    implements $RestaurantDataQueryCopyWith<$Res> {
  _$RestaurantDataQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantDataQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? restaurants = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      restaurants: null == restaurants
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<RestaurantData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantDataQueryImplCopyWith<$Res>
    implements $RestaurantDataQueryCopyWith<$Res> {
  factory _$$RestaurantDataQueryImplCopyWith(_$RestaurantDataQueryImpl value,
          $Res Function(_$RestaurantDataQueryImpl) then) =
      __$$RestaurantDataQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total, @JsonKey(name: 'business') List<RestaurantData> restaurants});
}

/// @nodoc
class __$$RestaurantDataQueryImplCopyWithImpl<$Res>
    extends _$RestaurantDataQueryCopyWithImpl<$Res, _$RestaurantDataQueryImpl>
    implements _$$RestaurantDataQueryImplCopyWith<$Res> {
  __$$RestaurantDataQueryImplCopyWithImpl(_$RestaurantDataQueryImpl _value,
      $Res Function(_$RestaurantDataQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantDataQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? restaurants = null,
  }) {
    return _then(_$RestaurantDataQueryImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      restaurants: null == restaurants
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<RestaurantData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantDataQueryImpl implements _RestaurantDataQuery {
  const _$RestaurantDataQueryImpl(
      {required this.total,
      @JsonKey(name: 'business')
      required final List<RestaurantData> restaurants})
      : _restaurants = restaurants;

  factory _$RestaurantDataQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDataQueryImplFromJson(json);

  @override
  final int total;
  final List<RestaurantData> _restaurants;
  @override
  @JsonKey(name: 'business')
  List<RestaurantData> get restaurants {
    if (_restaurants is EqualUnmodifiableListView) return _restaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  @override
  String toString() {
    return 'RestaurantDataQuery(total: $total, restaurants: $restaurants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDataQueryImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_restaurants));

  /// Create a copy of RestaurantDataQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDataQueryImplCopyWith<_$RestaurantDataQueryImpl> get copyWith =>
      __$$RestaurantDataQueryImplCopyWithImpl<_$RestaurantDataQueryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDataQueryImplToJson(
      this,
    );
  }
}

abstract class _RestaurantDataQuery implements RestaurantDataQuery {
  const factory _RestaurantDataQuery(
          {required final int total,
          @JsonKey(name: 'business')
          required final List<RestaurantData> restaurants}) =
      _$RestaurantDataQueryImpl;

  factory _RestaurantDataQuery.fromJson(Map<String, dynamic> json) =
      _$RestaurantDataQueryImpl.fromJson;

  @override
  int get total;
  @override
  @JsonKey(name: 'business')
  List<RestaurantData> get restaurants;

  /// Create a copy of RestaurantDataQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantDataQueryImplCopyWith<_$RestaurantDataQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantData _$RestaurantDataFromJson(Map<String, dynamic> json) {
  return _RestaurantData.fromJson(json);
}

/// @nodoc
mixin _$RestaurantData {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  List<RestaurantReviewData> get reviews => throw _privateConstructorUsedError;
  List<RestaurantCategoryData> get categories =>
      throw _privateConstructorUsedError;
  List<RestaurantLocationData> get location =>
      throw _privateConstructorUsedError;
  List<RestaurantAvailabilityData> get hours =>
      throw _privateConstructorUsedError;
  dynamic get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this RestaurantData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantDataCopyWith<RestaurantData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDataCopyWith<$Res> {
  factory $RestaurantDataCopyWith(
          RestaurantData value, $Res Function(RestaurantData) then) =
      _$RestaurantDataCopyWithImpl<$Res, RestaurantData>;
  @useResult
  $Res call(
      {String id,
      String name,
      String price,
      double rating,
      List<String> photos,
      List<RestaurantReviewData> reviews,
      List<RestaurantCategoryData> categories,
      List<RestaurantLocationData> location,
      List<RestaurantAvailabilityData> hours,
      dynamic isFavorite});
}

/// @nodoc
class _$RestaurantDataCopyWithImpl<$Res, $Val extends RestaurantData>
    implements $RestaurantDataCopyWith<$Res> {
  _$RestaurantDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? rating = null,
    Object? photos = null,
    Object? reviews = null,
    Object? categories = null,
    Object? location = null,
    Object? hours = null,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<RestaurantReviewData>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<RestaurantCategoryData>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<RestaurantLocationData>,
      hours: null == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as List<RestaurantAvailabilityData>,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantDataImplCopyWith<$Res>
    implements $RestaurantDataCopyWith<$Res> {
  factory _$$RestaurantDataImplCopyWith(_$RestaurantDataImpl value,
          $Res Function(_$RestaurantDataImpl) then) =
      __$$RestaurantDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String price,
      double rating,
      List<String> photos,
      List<RestaurantReviewData> reviews,
      List<RestaurantCategoryData> categories,
      List<RestaurantLocationData> location,
      List<RestaurantAvailabilityData> hours,
      dynamic isFavorite});
}

/// @nodoc
class __$$RestaurantDataImplCopyWithImpl<$Res>
    extends _$RestaurantDataCopyWithImpl<$Res, _$RestaurantDataImpl>
    implements _$$RestaurantDataImplCopyWith<$Res> {
  __$$RestaurantDataImplCopyWithImpl(
      _$RestaurantDataImpl _value, $Res Function(_$RestaurantDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? rating = null,
    Object? photos = null,
    Object? reviews = null,
    Object? categories = null,
    Object? location = null,
    Object? hours = null,
    Object? isFavorite = freezed,
  }) {
    return _then(_$RestaurantDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<RestaurantReviewData>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<RestaurantCategoryData>,
      location: null == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<RestaurantLocationData>,
      hours: null == hours
          ? _value._hours
          : hours // ignore: cast_nullable_to_non_nullable
              as List<RestaurantAvailabilityData>,
      isFavorite: freezed == isFavorite ? _value.isFavorite! : isFavorite,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantDataImpl implements _RestaurantData {
  const _$RestaurantDataImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.rating,
      required final List<String> photos,
      required final List<RestaurantReviewData> reviews,
      required final List<RestaurantCategoryData> categories,
      required final List<RestaurantLocationData> location,
      required final List<RestaurantAvailabilityData> hours,
      this.isFavorite = false})
      : _photos = photos,
        _reviews = reviews,
        _categories = categories,
        _location = location,
        _hours = hours;

  factory _$RestaurantDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDataImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String price;
  @override
  final double rating;
  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  final List<RestaurantReviewData> _reviews;
  @override
  List<RestaurantReviewData> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  final List<RestaurantCategoryData> _categories;
  @override
  List<RestaurantCategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<RestaurantLocationData> _location;
  @override
  List<RestaurantLocationData> get location {
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_location);
  }

  final List<RestaurantAvailabilityData> _hours;
  @override
  List<RestaurantAvailabilityData> get hours {
    if (_hours is EqualUnmodifiableListView) return _hours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hours);
  }

  @override
  @JsonKey()
  final dynamic isFavorite;

  @override
  String toString() {
    return 'RestaurantData(id: $id, name: $name, price: $price, rating: $rating, photos: $photos, reviews: $reviews, categories: $categories, location: $location, hours: $hours, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            const DeepCollectionEquality().equals(other._hours, _hours) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      price,
      rating,
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(_reviews),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_location),
      const DeepCollectionEquality().hash(_hours),
      const DeepCollectionEquality().hash(isFavorite));

  /// Create a copy of RestaurantData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDataImplCopyWith<_$RestaurantDataImpl> get copyWith =>
      __$$RestaurantDataImplCopyWithImpl<_$RestaurantDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDataImplToJson(
      this,
    );
  }
}

abstract class _RestaurantData implements RestaurantData {
  const factory _RestaurantData(
      {required final String id,
      required final String name,
      required final String price,
      required final double rating,
      required final List<String> photos,
      required final List<RestaurantReviewData> reviews,
      required final List<RestaurantCategoryData> categories,
      required final List<RestaurantLocationData> location,
      required final List<RestaurantAvailabilityData> hours,
      final dynamic isFavorite}) = _$RestaurantDataImpl;

  factory _RestaurantData.fromJson(Map<String, dynamic> json) =
      _$RestaurantDataImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get price;
  @override
  double get rating;
  @override
  List<String> get photos;
  @override
  List<RestaurantReviewData> get reviews;
  @override
  List<RestaurantCategoryData> get categories;
  @override
  List<RestaurantLocationData> get location;
  @override
  List<RestaurantAvailabilityData> get hours;
  @override
  dynamic get isFavorite;

  /// Create a copy of RestaurantData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantDataImplCopyWith<_$RestaurantDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {String id, String name, @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_$UserDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'image_url') required this.imageUrl});

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @override
  String toString() {
    return 'UserData(id: $id, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
          {required final String id,
          required final String name,
          @JsonKey(name: 'image_url') required final String imageUrl}) =
      _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantReviewData _$RestaurantReviewDataFromJson(Map<String, dynamic> json) {
  return _RestaurantReviewData.fromJson(json);
}

/// @nodoc
mixin _$RestaurantReviewData {
  String get id => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  UserData get user => throw _privateConstructorUsedError;

  /// Serializes this RestaurantReviewData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantReviewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantReviewDataCopyWith<RestaurantReviewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantReviewDataCopyWith<$Res> {
  factory $RestaurantReviewDataCopyWith(RestaurantReviewData value,
          $Res Function(RestaurantReviewData) then) =
      _$RestaurantReviewDataCopyWithImpl<$Res, RestaurantReviewData>;
  @useResult
  $Res call({String id, double rating, String text, UserData user});

  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class _$RestaurantReviewDataCopyWithImpl<$Res,
        $Val extends RestaurantReviewData>
    implements $RestaurantReviewDataCopyWith<$Res> {
  _$RestaurantReviewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantReviewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? text = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
    ) as $Val);
  }

  /// Create a copy of RestaurantReviewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get user {
    return $UserDataCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantReviewDataImplCopyWith<$Res>
    implements $RestaurantReviewDataCopyWith<$Res> {
  factory _$$RestaurantReviewDataImplCopyWith(_$RestaurantReviewDataImpl value,
          $Res Function(_$RestaurantReviewDataImpl) then) =
      __$$RestaurantReviewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double rating, String text, UserData user});

  @override
  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class __$$RestaurantReviewDataImplCopyWithImpl<$Res>
    extends _$RestaurantReviewDataCopyWithImpl<$Res, _$RestaurantReviewDataImpl>
    implements _$$RestaurantReviewDataImplCopyWith<$Res> {
  __$$RestaurantReviewDataImplCopyWithImpl(_$RestaurantReviewDataImpl _value,
      $Res Function(_$RestaurantReviewDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantReviewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? text = null,
    Object? user = null,
  }) {
    return _then(_$RestaurantReviewDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantReviewDataImpl implements _RestaurantReviewData {
  const _$RestaurantReviewDataImpl(
      {required this.id,
      required this.rating,
      required this.text,
      required this.user});

  factory _$RestaurantReviewDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantReviewDataImplFromJson(json);

  @override
  final String id;
  @override
  final double rating;
  @override
  final String text;
  @override
  final UserData user;

  @override
  String toString() {
    return 'RestaurantReviewData(id: $id, rating: $rating, text: $text, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantReviewDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rating, text, user);

  /// Create a copy of RestaurantReviewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantReviewDataImplCopyWith<_$RestaurantReviewDataImpl>
      get copyWith =>
          __$$RestaurantReviewDataImplCopyWithImpl<_$RestaurantReviewDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantReviewDataImplToJson(
      this,
    );
  }
}

abstract class _RestaurantReviewData implements RestaurantReviewData {
  const factory _RestaurantReviewData(
      {required final String id,
      required final double rating,
      required final String text,
      required final UserData user}) = _$RestaurantReviewDataImpl;

  factory _RestaurantReviewData.fromJson(Map<String, dynamic> json) =
      _$RestaurantReviewDataImpl.fromJson;

  @override
  String get id;
  @override
  double get rating;
  @override
  String get text;
  @override
  UserData get user;

  /// Create a copy of RestaurantReviewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantReviewDataImplCopyWith<_$RestaurantReviewDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RestaurantCategoryData _$RestaurantCategoryDataFromJson(
    Map<String, dynamic> json) {
  return _RestaurantCategoryData.fromJson(json);
}

/// @nodoc
mixin _$RestaurantCategoryData {
  String get title => throw _privateConstructorUsedError;
  String get alias => throw _privateConstructorUsedError;

  /// Serializes this RestaurantCategoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantCategoryDataCopyWith<RestaurantCategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCategoryDataCopyWith<$Res> {
  factory $RestaurantCategoryDataCopyWith(RestaurantCategoryData value,
          $Res Function(RestaurantCategoryData) then) =
      _$RestaurantCategoryDataCopyWithImpl<$Res, RestaurantCategoryData>;
  @useResult
  $Res call({String title, String alias});
}

/// @nodoc
class _$RestaurantCategoryDataCopyWithImpl<$Res,
        $Val extends RestaurantCategoryData>
    implements $RestaurantCategoryDataCopyWith<$Res> {
  _$RestaurantCategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? alias = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      alias: null == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantCategoryDataImplCopyWith<$Res>
    implements $RestaurantCategoryDataCopyWith<$Res> {
  factory _$$RestaurantCategoryDataImplCopyWith(
          _$RestaurantCategoryDataImpl value,
          $Res Function(_$RestaurantCategoryDataImpl) then) =
      __$$RestaurantCategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String alias});
}

/// @nodoc
class __$$RestaurantCategoryDataImplCopyWithImpl<$Res>
    extends _$RestaurantCategoryDataCopyWithImpl<$Res,
        _$RestaurantCategoryDataImpl>
    implements _$$RestaurantCategoryDataImplCopyWith<$Res> {
  __$$RestaurantCategoryDataImplCopyWithImpl(
      _$RestaurantCategoryDataImpl _value,
      $Res Function(_$RestaurantCategoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? alias = null,
  }) {
    return _then(_$RestaurantCategoryDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      alias: null == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantCategoryDataImpl implements _RestaurantCategoryData {
  const _$RestaurantCategoryDataImpl(
      {required this.title, required this.alias});

  factory _$RestaurantCategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantCategoryDataImplFromJson(json);

  @override
  final String title;
  @override
  final String alias;

  @override
  String toString() {
    return 'RestaurantCategoryData(title: $title, alias: $alias)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantCategoryDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.alias, alias) || other.alias == alias));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, alias);

  /// Create a copy of RestaurantCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantCategoryDataImplCopyWith<_$RestaurantCategoryDataImpl>
      get copyWith => __$$RestaurantCategoryDataImplCopyWithImpl<
          _$RestaurantCategoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantCategoryDataImplToJson(
      this,
    );
  }
}

abstract class _RestaurantCategoryData implements RestaurantCategoryData {
  const factory _RestaurantCategoryData(
      {required final String title,
      required final String alias}) = _$RestaurantCategoryDataImpl;

  factory _RestaurantCategoryData.fromJson(Map<String, dynamic> json) =
      _$RestaurantCategoryDataImpl.fromJson;

  @override
  String get title;
  @override
  String get alias;

  /// Create a copy of RestaurantCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantCategoryDataImplCopyWith<_$RestaurantCategoryDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RestaurantAvailabilityData _$RestaurantAvailabilityDataFromJson(
    Map<String, dynamic> json) {
  return _RestaurantAvailabilityData.fromJson(json);
}

/// @nodoc
mixin _$RestaurantAvailabilityData {
  @JsonKey(name: 'is_open_now')
  bool get isNowOpen => throw _privateConstructorUsedError;

  /// Serializes this RestaurantAvailabilityData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantAvailabilityData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantAvailabilityDataCopyWith<RestaurantAvailabilityData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantAvailabilityDataCopyWith<$Res> {
  factory $RestaurantAvailabilityDataCopyWith(RestaurantAvailabilityData value,
          $Res Function(RestaurantAvailabilityData) then) =
      _$RestaurantAvailabilityDataCopyWithImpl<$Res,
          RestaurantAvailabilityData>;
  @useResult
  $Res call({@JsonKey(name: 'is_open_now') bool isNowOpen});
}

/// @nodoc
class _$RestaurantAvailabilityDataCopyWithImpl<$Res,
        $Val extends RestaurantAvailabilityData>
    implements $RestaurantAvailabilityDataCopyWith<$Res> {
  _$RestaurantAvailabilityDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantAvailabilityData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNowOpen = null,
  }) {
    return _then(_value.copyWith(
      isNowOpen: null == isNowOpen
          ? _value.isNowOpen
          : isNowOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantAvailabilityDataImplCopyWith<$Res>
    implements $RestaurantAvailabilityDataCopyWith<$Res> {
  factory _$$RestaurantAvailabilityDataImplCopyWith(
          _$RestaurantAvailabilityDataImpl value,
          $Res Function(_$RestaurantAvailabilityDataImpl) then) =
      __$$RestaurantAvailabilityDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'is_open_now') bool isNowOpen});
}

/// @nodoc
class __$$RestaurantAvailabilityDataImplCopyWithImpl<$Res>
    extends _$RestaurantAvailabilityDataCopyWithImpl<$Res,
        _$RestaurantAvailabilityDataImpl>
    implements _$$RestaurantAvailabilityDataImplCopyWith<$Res> {
  __$$RestaurantAvailabilityDataImplCopyWithImpl(
      _$RestaurantAvailabilityDataImpl _value,
      $Res Function(_$RestaurantAvailabilityDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantAvailabilityData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNowOpen = null,
  }) {
    return _then(_$RestaurantAvailabilityDataImpl(
      isNowOpen: null == isNowOpen
          ? _value.isNowOpen
          : isNowOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantAvailabilityDataImpl implements _RestaurantAvailabilityData {
  const _$RestaurantAvailabilityDataImpl(
      {@JsonKey(name: 'is_open_now') required this.isNowOpen});

  factory _$RestaurantAvailabilityDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RestaurantAvailabilityDataImplFromJson(json);

  @override
  @JsonKey(name: 'is_open_now')
  final bool isNowOpen;

  @override
  String toString() {
    return 'RestaurantAvailabilityData(isNowOpen: $isNowOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantAvailabilityDataImpl &&
            (identical(other.isNowOpen, isNowOpen) ||
                other.isNowOpen == isNowOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isNowOpen);

  /// Create a copy of RestaurantAvailabilityData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantAvailabilityDataImplCopyWith<_$RestaurantAvailabilityDataImpl>
      get copyWith => __$$RestaurantAvailabilityDataImplCopyWithImpl<
          _$RestaurantAvailabilityDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantAvailabilityDataImplToJson(
      this,
    );
  }
}

abstract class _RestaurantAvailabilityData
    implements RestaurantAvailabilityData {
  const factory _RestaurantAvailabilityData(
          {@JsonKey(name: 'is_open_now') required final bool isNowOpen}) =
      _$RestaurantAvailabilityDataImpl;

  factory _RestaurantAvailabilityData.fromJson(Map<String, dynamic> json) =
      _$RestaurantAvailabilityDataImpl.fromJson;

  @override
  @JsonKey(name: 'is_open_now')
  bool get isNowOpen;

  /// Create a copy of RestaurantAvailabilityData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantAvailabilityDataImplCopyWith<_$RestaurantAvailabilityDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RestaurantLocationData _$RestaurantLocationDataFromJson(
    Map<String, dynamic> json) {
  return _RestaurantLocationData.fromJson(json);
}

/// @nodoc
mixin _$RestaurantLocationData {
  @JsonKey(name: 'formatted_address')
  String get address => throw _privateConstructorUsedError;

  /// Serializes this RestaurantLocationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantLocationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantLocationDataCopyWith<RestaurantLocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantLocationDataCopyWith<$Res> {
  factory $RestaurantLocationDataCopyWith(RestaurantLocationData value,
          $Res Function(RestaurantLocationData) then) =
      _$RestaurantLocationDataCopyWithImpl<$Res, RestaurantLocationData>;
  @useResult
  $Res call({@JsonKey(name: 'formatted_address') String address});
}

/// @nodoc
class _$RestaurantLocationDataCopyWithImpl<$Res,
        $Val extends RestaurantLocationData>
    implements $RestaurantLocationDataCopyWith<$Res> {
  _$RestaurantLocationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantLocationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantLocationDataImplCopyWith<$Res>
    implements $RestaurantLocationDataCopyWith<$Res> {
  factory _$$RestaurantLocationDataImplCopyWith(
          _$RestaurantLocationDataImpl value,
          $Res Function(_$RestaurantLocationDataImpl) then) =
      __$$RestaurantLocationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'formatted_address') String address});
}

/// @nodoc
class __$$RestaurantLocationDataImplCopyWithImpl<$Res>
    extends _$RestaurantLocationDataCopyWithImpl<$Res,
        _$RestaurantLocationDataImpl>
    implements _$$RestaurantLocationDataImplCopyWith<$Res> {
  __$$RestaurantLocationDataImplCopyWithImpl(
      _$RestaurantLocationDataImpl _value,
      $Res Function(_$RestaurantLocationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantLocationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$RestaurantLocationDataImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantLocationDataImpl implements _RestaurantLocationData {
  const _$RestaurantLocationDataImpl(
      {@JsonKey(name: 'formatted_address') required this.address});

  factory _$RestaurantLocationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantLocationDataImplFromJson(json);

  @override
  @JsonKey(name: 'formatted_address')
  final String address;

  @override
  String toString() {
    return 'RestaurantLocationData(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantLocationDataImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address);

  /// Create a copy of RestaurantLocationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantLocationDataImplCopyWith<_$RestaurantLocationDataImpl>
      get copyWith => __$$RestaurantLocationDataImplCopyWithImpl<
          _$RestaurantLocationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantLocationDataImplToJson(
      this,
    );
  }
}

abstract class _RestaurantLocationData implements RestaurantLocationData {
  const factory _RestaurantLocationData(
          {@JsonKey(name: 'formatted_address') required final String address}) =
      _$RestaurantLocationDataImpl;

  factory _RestaurantLocationData.fromJson(Map<String, dynamic> json) =
      _$RestaurantLocationDataImpl.fromJson;

  @override
  @JsonKey(name: 'formatted_address')
  String get address;

  /// Create a copy of RestaurantLocationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantLocationDataImplCopyWith<_$RestaurantLocationDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
