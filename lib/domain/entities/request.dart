import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';

part 'request.freezed.dart';
part 'request.g.dart';

enum ListingType { request, ad }

@Freezed(
  fromJson: true,
  toJson: true,
)
class PhoneRequest with _$PhoneRequest {
  PhoneRequest._();

  factory PhoneRequest({
    required String id,
    @Default(0) double price,
    @Default(false) bool isDisabled,
    required String userId,
    required PhoneNumber item,
  }) = _PhoneRequest;

  factory PhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneRequestFromJson(json);

  factory PhoneRequest.fromSnapshot(DocumentSnapshot snapshot) =>
      PhoneRequest.fromJson(
          {'id': snapshot.id, ...snapshot.data() as Map<String, dynamic>});

  static PhoneRequest mockPhoneRequest() {
    return PhoneRequest(
        id: "mockPhoneId",
        price: 5000.0,
        item: PhoneNumber.mockList(1).first,
        userId: 'mockUser');
  }

  @override
  Map<String, dynamic> toJson() => toJson();
}

@Freezed(
  fromJson: true,
  toJson: true,
)
class PlateRequest with _$PlateRequest {
  PlateRequest._();

  factory PlateRequest({
    required String id,
    @Default(0) double price,
    @Default(false) bool isDisabled,
    required String userId,
    required PlateNumber item,
  }) = _PlateRequest;

  bool get priceHidden => price == 0;

  factory PlateRequest.fromJson(Map<String, dynamic> json) =>
      _$PlateRequestFromJson(json);

  factory PlateRequest.fromSnapshot(DocumentSnapshot snapshot) =>
      PlateRequest.fromJson(
          {'id': snapshot.id, ...snapshot.data() as Map<String, dynamic>});

  static PlateRequest mockPlateRequest() {
    return PlateRequest(
      id: "mockPlateId",
      price: 15000.0,
      userId: 'mockUser',
      item: PlateNumber.mockList(1).first,
    );
  }

  @override
  Map<String, dynamic> toJson() => toJson();
}
