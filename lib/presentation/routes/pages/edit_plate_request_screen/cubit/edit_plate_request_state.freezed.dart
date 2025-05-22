// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_plate_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditPlateRequestState {
  String get requestId => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of EditPlateRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditPlateRequestStateCopyWith<EditPlateRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPlateRequestStateCopyWith<$Res> {
  factory $EditPlateRequestStateCopyWith(EditPlateRequestState value,
          $Res Function(EditPlateRequestState) then) =
      _$EditPlateRequestStateCopyWithImpl<$Res, EditPlateRequestState>;
  @useResult
  $Res call(
      {String requestId,
      String code,
      String number,
      String description,
      bool isSubmitting,
      String? errorMessage});
}

/// @nodoc
class _$EditPlateRequestStateCopyWithImpl<$Res,
        $Val extends EditPlateRequestState>
    implements $EditPlateRequestStateCopyWith<$Res> {
  _$EditPlateRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditPlateRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? code = null,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EditPlateRequestStateImplCopyWith<$Res>
    implements $EditPlateRequestStateCopyWith<$Res> {
  factory _$$EditPlateRequestStateImplCopyWith(
          _$EditPlateRequestStateImpl value,
          $Res Function(_$EditPlateRequestStateImpl) then) =
      __$$EditPlateRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String requestId,
      String code,
      String number,
      String description,
      bool isSubmitting,
      String? errorMessage});
}

/// @nodoc
class __$$EditPlateRequestStateImplCopyWithImpl<$Res>
    extends _$EditPlateRequestStateCopyWithImpl<$Res,
        _$EditPlateRequestStateImpl>
    implements _$$EditPlateRequestStateImplCopyWith<$Res> {
  __$$EditPlateRequestStateImplCopyWithImpl(_$EditPlateRequestStateImpl _value,
      $Res Function(_$EditPlateRequestStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditPlateRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? code = null,
    Object? number = null,
    Object? description = null,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$EditPlateRequestStateImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
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

class _$EditPlateRequestStateImpl implements _EditPlateRequestState {
  const _$EditPlateRequestStateImpl(
      {required this.requestId,
      required this.code,
      required this.number,
      this.description = '',
      this.isSubmitting = false,
      this.errorMessage});

  @override
  final String requestId;
  @override
  final String code;
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
    return 'EditPlateRequestState(requestId: $requestId, code: $code, number: $number, description: $description, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditPlateRequestStateImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId, code, number,
      description, isSubmitting, errorMessage);

  /// Create a copy of EditPlateRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditPlateRequestStateImplCopyWith<_$EditPlateRequestStateImpl>
      get copyWith => __$$EditPlateRequestStateImplCopyWithImpl<
          _$EditPlateRequestStateImpl>(this, _$identity);
}

abstract class _EditPlateRequestState implements EditPlateRequestState {
  const factory _EditPlateRequestState(
      {required final String requestId,
      required final String code,
      required final String number,
      final String description,
      final bool isSubmitting,
      final String? errorMessage}) = _$EditPlateRequestStateImpl;

  @override
  String get requestId;
  @override
  String get code;
  @override
  String get number;
  @override
  String get description;
  @override
  bool get isSubmitting;
  @override
  String? get errorMessage;

  /// Create a copy of EditPlateRequestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditPlateRequestStateImplCopyWith<_$EditPlateRequestStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
