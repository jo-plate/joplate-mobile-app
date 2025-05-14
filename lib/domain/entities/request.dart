import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/utils/converters.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@Freezed(
  fromJson: true,
  toJson: true,
)
class PhoneRequest with _$PhoneRequest {
  PhoneRequest._();

  factory PhoneRequest({
    required String id,
    @Default(0) int price,
    @Default(false) bool isDisabled,
    required String userId,
    required PhoneNumber item,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? expiresAt,
    @Default(0) int visits,
  }) = _PhoneRequest;

  factory PhoneRequest.fromJson(Map<String, dynamic> json) => _$PhoneRequestFromJson(json);

  factory PhoneRequest.fromSnapshot(DocumentSnapshot snapshot) =>
      PhoneRequest.fromJson({'id': snapshot.id, ...snapshot.data() as Map<String, dynamic>});

  static PhoneRequest mockPhoneRequest() {
    return PhoneRequest(id: "mockPhoneId", price: 5000, item: PhoneNumber.mockList(1).first, userId: 'mockUser');
  }

  bool get priceHidden => price == 0;
  @override
  Map<String, dynamic> toJson() => toJson();

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
}

@Freezed(
  fromJson: true,
  toJson: true,
)
class PlateRequest with _$PlateRequest {
  PlateRequest._();

  factory PlateRequest({
    required String id,
    @Default(0) int price,
    @Default(false) bool isDisabled,
    required String userId,
    required PlateNumber item,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? expiresAt,
    @Default(0) int visits,
  }) = _PlateRequest;

  factory PlateRequest.fromJson(Map<String, dynamic> json) => _$PlateRequestFromJson(json);

  factory PlateRequest.fromSnapshot(DocumentSnapshot snapshot) =>
      PlateRequest.fromJson({'id': snapshot.id, ...snapshot.data() as Map<String, dynamic>});
  bool get priceHidden => price == 0;

  static PlateRequest mockPlateRequest() {
    return PlateRequest(
      id: "mockPlateId",
      price: 15000,
      userId: 'mockUser',
      item: PlateNumber.mockList(1).first,
      visits: 0,
    );
  }

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  @override
  Map<String, dynamic> toJson() => toJson();
}
