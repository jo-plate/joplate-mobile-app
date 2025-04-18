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
  List<String> get favoritePhonesIds => throw _privateConstructorUsedError;
  List<String> get favoritePlatesIds => throw _privateConstructorUsedError;
  List<PhoneListing> get favoritePhones => throw _privateConstructorUsedError;
  List<PlateListing> get favoritePlates => throw _privateConstructorUsedError;

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
      {List<String> favoritePhonesIds,
      List<String> favoritePlatesIds,
      List<PhoneListing> favoritePhones,
      List<PlateListing> favoritePlates});
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
    Object? favoritePhonesIds = null,
    Object? favoritePlatesIds = null,
    Object? favoritePhones = null,
    Object? favoritePlates = null,
  }) {
    return _then(_value.copyWith(
      favoritePhonesIds: null == favoritePhonesIds
          ? _value.favoritePhonesIds
          : favoritePhonesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoritePlatesIds: null == favoritePlatesIds
          ? _value.favoritePlatesIds
          : favoritePlatesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoritePhones: null == favoritePhones
          ? _value.favoritePhones
          : favoritePhones // ignore: cast_nullable_to_non_nullable
              as List<PhoneListing>,
      favoritePlates: null == favoritePlates
          ? _value.favoritePlates
          : favoritePlates // ignore: cast_nullable_to_non_nullable
              as List<PlateListing>,
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
      {List<String> favoritePhonesIds,
      List<String> favoritePlatesIds,
      List<PhoneListing> favoritePhones,
      List<PlateListing> favoritePlates});
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
    Object? favoritePhonesIds = null,
    Object? favoritePlatesIds = null,
    Object? favoritePhones = null,
    Object? favoritePlates = null,
  }) {
    return _then(_$UserFavoritesImpl(
      favoritePhonesIds: null == favoritePhonesIds
          ? _value._favoritePhonesIds
          : favoritePhonesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoritePlatesIds: null == favoritePlatesIds
          ? _value._favoritePlatesIds
          : favoritePlatesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoritePhones: null == favoritePhones
          ? _value._favoritePhones
          : favoritePhones // ignore: cast_nullable_to_non_nullable
              as List<PhoneListing>,
      favoritePlates: null == favoritePlates
          ? _value._favoritePlates
          : favoritePlates // ignore: cast_nullable_to_non_nullable
              as List<PlateListing>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFavoritesImpl extends _UserFavorites {
  const _$UserFavoritesImpl(
      {final List<String> favoritePhonesIds = const [],
      final List<String> favoritePlatesIds = const [],
      final List<PhoneListing> favoritePhones = const [],
      final List<PlateListing> favoritePlates = const []})
      : _favoritePhonesIds = favoritePhonesIds,
        _favoritePlatesIds = favoritePlatesIds,
        _favoritePhones = favoritePhones,
        _favoritePlates = favoritePlates,
        super._();

  factory _$UserFavoritesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFavoritesImplFromJson(json);

  final List<String> _favoritePhonesIds;
  @override
  @JsonKey()
  List<String> get favoritePhonesIds {
    if (_favoritePhonesIds is EqualUnmodifiableListView)
      return _favoritePhonesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePhonesIds);
  }

  final List<String> _favoritePlatesIds;
  @override
  @JsonKey()
  List<String> get favoritePlatesIds {
    if (_favoritePlatesIds is EqualUnmodifiableListView)
      return _favoritePlatesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePlatesIds);
  }

  final List<PhoneListing> _favoritePhones;
  @override
  @JsonKey()
  List<PhoneListing> get favoritePhones {
    if (_favoritePhones is EqualUnmodifiableListView) return _favoritePhones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePhones);
  }

  final List<PlateListing> _favoritePlates;
  @override
  @JsonKey()
  List<PlateListing> get favoritePlates {
    if (_favoritePlates is EqualUnmodifiableListView) return _favoritePlates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePlates);
  }

  @override
  String toString() {
    return 'UserFavorites(favoritePhonesIds: $favoritePhonesIds, favoritePlatesIds: $favoritePlatesIds, favoritePhones: $favoritePhones, favoritePlates: $favoritePlates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFavoritesImpl &&
            const DeepCollectionEquality()
                .equals(other._favoritePhonesIds, _favoritePhonesIds) &&
            const DeepCollectionEquality()
                .equals(other._favoritePlatesIds, _favoritePlatesIds) &&
            const DeepCollectionEquality()
                .equals(other._favoritePhones, _favoritePhones) &&
            const DeepCollectionEquality()
                .equals(other._favoritePlates, _favoritePlates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favoritePhonesIds),
      const DeepCollectionEquality().hash(_favoritePlatesIds),
      const DeepCollectionEquality().hash(_favoritePhones),
      const DeepCollectionEquality().hash(_favoritePlates));

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
      {final List<String> favoritePhonesIds,
      final List<String> favoritePlatesIds,
      final List<PhoneListing> favoritePhones,
      final List<PlateListing> favoritePlates}) = _$UserFavoritesImpl;
  const _UserFavorites._() : super._();

  factory _UserFavorites.fromJson(Map<String, dynamic> json) =
      _$UserFavoritesImpl.fromJson;

  @override
  List<String> get favoritePhonesIds;
  @override
  List<String> get favoritePlatesIds;
  @override
  List<PhoneListing> get favoritePhones;
  @override
  List<PlateListing> get favoritePlates;

  /// Create a copy of UserFavorites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserFavoritesImplCopyWith<_$UserFavoritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
