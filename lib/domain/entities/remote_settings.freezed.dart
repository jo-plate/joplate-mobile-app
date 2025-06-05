// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteSettings _$RemoteSettingsFromJson(Map<String, dynamic> json) {
  return _RemoteSettings.fromJson(json);
}

/// @nodoc
mixin _$RemoteSettings {
  bool get promocode => throw _privateConstructorUsedError;

  /// Serializes this RemoteSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemoteSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteSettingsCopyWith<RemoteSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteSettingsCopyWith<$Res> {
  factory $RemoteSettingsCopyWith(
          RemoteSettings value, $Res Function(RemoteSettings) then) =
      _$RemoteSettingsCopyWithImpl<$Res, RemoteSettings>;
  @useResult
  $Res call({bool promocode});
}

/// @nodoc
class _$RemoteSettingsCopyWithImpl<$Res, $Val extends RemoteSettings>
    implements $RemoteSettingsCopyWith<$Res> {
  _$RemoteSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promocode = null,
  }) {
    return _then(_value.copyWith(
      promocode: null == promocode
          ? _value.promocode
          : promocode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteSettingsImplCopyWith<$Res>
    implements $RemoteSettingsCopyWith<$Res> {
  factory _$$RemoteSettingsImplCopyWith(_$RemoteSettingsImpl value,
          $Res Function(_$RemoteSettingsImpl) then) =
      __$$RemoteSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool promocode});
}

/// @nodoc
class __$$RemoteSettingsImplCopyWithImpl<$Res>
    extends _$RemoteSettingsCopyWithImpl<$Res, _$RemoteSettingsImpl>
    implements _$$RemoteSettingsImplCopyWith<$Res> {
  __$$RemoteSettingsImplCopyWithImpl(
      _$RemoteSettingsImpl _value, $Res Function(_$RemoteSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promocode = null,
  }) {
    return _then(_$RemoteSettingsImpl(
      promocode: null == promocode
          ? _value.promocode
          : promocode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteSettingsImpl implements _RemoteSettings {
  const _$RemoteSettingsImpl({this.promocode = false});

  factory _$RemoteSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool promocode;

  @override
  String toString() {
    return 'RemoteSettings(promocode: $promocode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteSettingsImpl &&
            (identical(other.promocode, promocode) ||
                other.promocode == promocode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, promocode);

  /// Create a copy of RemoteSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteSettingsImplCopyWith<_$RemoteSettingsImpl> get copyWith =>
      __$$RemoteSettingsImplCopyWithImpl<_$RemoteSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteSettingsImplToJson(
      this,
    );
  }
}

abstract class _RemoteSettings implements RemoteSettings {
  const factory _RemoteSettings({final bool promocode}) = _$RemoteSettingsImpl;

  factory _RemoteSettings.fromJson(Map<String, dynamic> json) =
      _$RemoteSettingsImpl.fromJson;

  @override
  bool get promocode;

  /// Create a copy of RemoteSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteSettingsImplCopyWith<_$RemoteSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
