// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_phone_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditPhoneRequestState {
  String get requestId => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of EditPhoneRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditPhoneRequestStateCopyWith<EditPhoneRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPhoneRequestStateCopyWith<$Res> {
  factory $EditPhoneRequestStateCopyWith(EditPhoneRequestState value,
          $Res Function(EditPhoneRequestState) then) =
      _$EditPhoneRequestStateCopyWithImpl<$Res, EditPhoneRequestState>;
  @useResult
  $Res call(
      {String requestId,
      String number,
      String description,
      bool isSubmitting,
      String? errorMessage});
}

/// @nodoc
class _$EditPhoneRequestStateCopyWithImpl<$Res,
        $Val extends EditPhoneRequestState>
    implements $EditPhoneRequestStateCopyWith<$Res> {
  _$EditPhoneRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditPhoneRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? number = null,
    Object? description = null,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditPhoneRequestStateImplCopyWith<$Res>
    implements $EditPhoneRequestStateCopyWith<$Res> {
  factory _$$EditPhoneRequestStateImplCopyWith(
          _$EditPhoneRequestStateImpl value,
          $Res Function(_$EditPhoneRequestStateImpl) then) =
      __$$EditPhoneRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String requestId,
      String number,
      String description,
      bool isSubmitting,
      String? errorMessage});
}

/// @nodoc
class __$$EditPhoneRequestStateImplCopyWithImpl<$Res>
    extends _$EditPhoneRequestStateCopyWithImpl<$Res,
        _$EditPhoneRequestStateImpl>
    implements _$$EditPhoneRequestStateImplCopyWith<$Res> {
  __$$EditPhoneRequestStateImplCopyWithImpl(_$EditPhoneRequestStateImpl _value,
      $Res Function(_$EditPhoneRequestStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditPhoneRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? number = null,
    Object? description = null,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$EditPhoneRequestStateImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EditPhoneRequestStateImpl implements _EditPhoneRequestState {
  const _$EditPhoneRequestStateImpl(
      {required this.requestId,
      required this.number,
      this.description = '',
      this.isSubmitting = false,
      this.errorMessage});

  @override
  final String requestId;
  @override
  final String number;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'EditPhoneRequestState(requestId: $requestId, number: $number, description: $description, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditPhoneRequestStateImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, requestId, number, description, isSubmitting, errorMessage);

  /// Create a copy of EditPhoneRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditPhoneRequestStateImplCopyWith<_$EditPhoneRequestStateImpl>
      get copyWith => __$$EditPhoneRequestStateImplCopyWithImpl<
          _$EditPhoneRequestStateImpl>(this, _$identity);
}

abstract class _EditPhoneRequestState implements EditPhoneRequestState {
  const factory _EditPhoneRequestState(
      {required final String requestId,
      required final String number,
      final String description,
      final bool isSubmitting,
      final String? errorMessage}) = _$EditPhoneRequestStateImpl;

  @override
  String get requestId;
  @override
  String get number;
  @override
  String get description;
  @override
  bool get isSubmitting;
  @override
  String? get errorMessage;

  /// Create a copy of EditPhoneRequestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditPhoneRequestStateImplCopyWith<_$EditPhoneRequestStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
