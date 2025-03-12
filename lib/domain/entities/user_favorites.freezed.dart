// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_favorites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserFavorites _$UserFavoritesFromJson(Map<String, dynamic> json) {
  return _UserFavorites.fromJson(json);
}

/// @nodoc
mixin _$UserFavorites {
  List<String> get favoritePhones => throw _privateConstructorUsedError;
  List<String> get favoritePlates => throw _privateConstructorUsedError;
  List<Listing<PhoneNumber>> get favoritePhoneListings =>
      throw _privateConstructorUsedError;
  List<Listing<PlateNumber>> get favoritePlateListings =>
      throw _privateConstructorUsedError;

  /// Serializes this UserFavorites to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserFavorites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserFavoritesCopyWith<UserFavorites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFavoritesCopyWith<$Res> {
  factory $UserFavoritesCopyWith(
          UserFavorites value, $Res Function(UserFavorites) then) =
      _$UserFavoritesCopyWithImpl<$Res, UserFavorites>;
  @useResult
  $Res call(
      {List<String> favoritePhones,
      List<String> favoritePlates,
      List<Listing<PhoneNumber>> favoritePhoneListings,
      List<Listing<PlateNumber>> favoritePlateListings});
}

/// @nodoc
class _$UserFavoritesCopyWithImpl<$Res, $Val extends UserFavorites>
    implements $UserFavoritesCopyWith<$Res> {
  _$UserFavoritesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserFavorites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoritePhones = null,
    Object? favoritePlates = null,
    Object? favoritePhoneListings = null,
    Object? favoritePlateListings = null,
  }) {
    return _then(_value.copyWith(
      favoritePhones: null == favoritePhones
          ? _value.favoritePhones
          : favoritePhones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoritePlates: null == favoritePlates
          ? _value.favoritePlates
          : favoritePlates // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoritePhoneListings: null == favoritePhoneListings
          ? _value.favoritePhoneListings
          : favoritePhoneListings // ignore: cast_nullable_to_non_nullable
              as List<Listing<PhoneNumber>>,
      favoritePlateListings: null == favoritePlateListings
          ? _value.favoritePlateListings
          : favoritePlateListings // ignore: cast_nullable_to_non_nullable
              as List<Listing<PlateNumber>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFavoritesImplCopyWith<$Res>
    implements $UserFavoritesCopyWith<$Res> {
  factory _$$UserFavoritesImplCopyWith(
          _$UserFavoritesImpl value, $Res Function(_$UserFavoritesImpl) then) =
      __$$UserFavoritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> favoritePhones,
      List<String> favoritePlates,
      List<Listing<PhoneNumber>> favoritePhoneListings,
      List<Listing<PlateNumber>> favoritePlateListings});
}

/// @nodoc
class __$$UserFavoritesImplCopyWithImpl<$Res>
    extends _$UserFavoritesCopyWithImpl<$Res, _$UserFavoritesImpl>
    implements _$$UserFavoritesImplCopyWith<$Res> {
  __$$UserFavoritesImplCopyWithImpl(
      _$UserFavoritesImpl _value, $Res Function(_$UserFavoritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserFavorites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoritePhones = null,
    Object? favoritePlates = null,
    Object? favoritePhoneListings = null,
    Object? favoritePlateListings = null,
  }) {
    return _then(_$UserFavoritesImpl(
      favoritePhones: null == favoritePhones
          ? _value._favoritePhones
          : favoritePhones // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoritePlates: null == favoritePlates
          ? _value._favoritePlates
          : favoritePlates // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoritePhoneListings: null == favoritePhoneListings
          ? _value._favoritePhoneListings
          : favoritePhoneListings // ignore: cast_nullable_to_non_nullable
              as List<Listing<PhoneNumber>>,
      favoritePlateListings: null == favoritePlateListings
          ? _value._favoritePlateListings
          : favoritePlateListings // ignore: cast_nullable_to_non_nullable
              as List<Listing<PlateNumber>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFavoritesImpl extends _UserFavorites {
  const _$UserFavoritesImpl(
      {final List<String> favoritePhones = const [],
      final List<String> favoritePlates = const [],
      final List<Listing<PhoneNumber>> favoritePhoneListings = const [],
      final List<Listing<PlateNumber>> favoritePlateListings = const []})
      : _favoritePhones = favoritePhones,
        _favoritePlates = favoritePlates,
        _favoritePhoneListings = favoritePhoneListings,
        _favoritePlateListings = favoritePlateListings,
        super._();

  factory _$UserFavoritesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFavoritesImplFromJson(json);

  final List<String> _favoritePhones;
  @override
  @JsonKey()
  List<String> get favoritePhones {
    if (_favoritePhones is EqualUnmodifiableListView) return _favoritePhones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePhones);
  }

  final List<String> _favoritePlates;
  @override
  @JsonKey()
  List<String> get favoritePlates {
    if (_favoritePlates is EqualUnmodifiableListView) return _favoritePlates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePlates);
  }

  final List<Listing<PhoneNumber>> _favoritePhoneListings;
  @override
  @JsonKey()
  List<Listing<PhoneNumber>> get favoritePhoneListings {
    if (_favoritePhoneListings is EqualUnmodifiableListView)
      return _favoritePhoneListings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePhoneListings);
  }

  final List<Listing<PlateNumber>> _favoritePlateListings;
  @override
  @JsonKey()
  List<Listing<PlateNumber>> get favoritePlateListings {
    if (_favoritePlateListings is EqualUnmodifiableListView)
      return _favoritePlateListings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePlateListings);
  }

  @override
  String toString() {
    return 'UserFavorites(favoritePhones: $favoritePhones, favoritePlates: $favoritePlates, favoritePhoneListings: $favoritePhoneListings, favoritePlateListings: $favoritePlateListings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFavoritesImpl &&
            const DeepCollectionEquality()
                .equals(other._favoritePhones, _favoritePhones) &&
            const DeepCollectionEquality()
                .equals(other._favoritePlates, _favoritePlates) &&
            const DeepCollectionEquality()
                .equals(other._favoritePhoneListings, _favoritePhoneListings) &&
            const DeepCollectionEquality()
                .equals(other._favoritePlateListings, _favoritePlateListings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favoritePhones),
      const DeepCollectionEquality().hash(_favoritePlates),
      const DeepCollectionEquality().hash(_favoritePhoneListings),
      const DeepCollectionEquality().hash(_favoritePlateListings));

  /// Create a copy of UserFavorites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFavoritesImplCopyWith<_$UserFavoritesImpl> get copyWith =>
      __$$UserFavoritesImplCopyWithImpl<_$UserFavoritesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFavoritesImplToJson(
      this,
    );
  }
}

abstract class _UserFavorites extends UserFavorites {
  const factory _UserFavorites(
          {final List<String> favoritePhones,
          final List<String> favoritePlates,
          final List<Listing<PhoneNumber>> favoritePhoneListings,
          final List<Listing<PlateNumber>> favoritePlateListings}) =
      _$UserFavoritesImpl;
  const _UserFavorites._() : super._();

  factory _UserFavorites.fromJson(Map<String, dynamic> json) =
      _$UserFavoritesImpl.fromJson;

  @override
  List<String> get favoritePhones;
  @override
  List<String> get favoritePlates;
  @override
  List<Listing<PhoneNumber>> get favoritePhoneListings;
  @override
  List<Listing<PlateNumber>> get favoritePlateListings;

  /// Create a copy of UserFavorites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserFavoritesImplCopyWith<_$UserFavoritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
