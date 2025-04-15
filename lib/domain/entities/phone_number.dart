// phone number model

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/listing_v2.dart';
import 'package:joplate/gen/assets.gen.dart';

part 'phone_number.freezed.dart';
part 'phone_number.g.dart';

enum PhoneOperator {
  orange,
  zain,
  umniah,
}

@freezed
class PhoneNumber with _$PhoneNumber {
  const PhoneNumber._();

  const factory PhoneNumber({
    required String number,
    @Default([]) List<ListingV2> ads,
  }) = _PhoneNumber;

  bool get isFeatured => ads.any((a) => a.isFeatured);

  static List<PhoneNumber> mockList(int number) {
    return List.generate(
      number,
      (index) => PhoneNumber(
        // 079xxxxxxx
        number: '079${index.toString().padLeft(7, '5')}',
        ads: [ListingV2.mockAd()],
      ),
    );
  }

  PhoneOperator get phoneOperator {
    if (number.startsWith('077')) {
      return PhoneOperator.orange;
    } else if (number.startsWith('079')) {
      return PhoneOperator.zain;
    } else {
      return PhoneOperator.umniah;
    }
  }

  factory PhoneNumber.fromJson(Map<String, dynamic> json) => _$PhoneNumberFromJson(json);

  factory PhoneNumber.fromString(String phoneNumber) {
    return PhoneNumber(number: phoneNumber);
  }

  @override
  String toString() {
    return number;
  }

  Color get operatorColor {
    if (phoneOperator == PhoneOperator.umniah) {
      return const Color(0xFFE0E622);
    } else if (phoneOperator == PhoneOperator.orange) {
      return const Color(0xFFFF7900);
    } else if (phoneOperator == PhoneOperator.zain) {
      return const Color(0xFF0F6A65);
    }
    return Colors.grey[500]!;
  }

  ImageProvider get operatorLogo {
    if (phoneOperator == PhoneOperator.orange) {
      return Assets.images.orange.provider();
    } else if (phoneOperator == PhoneOperator.zain) {
      return Assets.images.zain.provider();
    } else {
      return Assets.images.umniah.provider();
    }
  }
}
