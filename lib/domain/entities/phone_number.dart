// phone number model

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/gen/assets.gen.dart';

part 'phone_number.freezed.dart';
part 'phone_number.g.dart';

enum PhoneOperator {
  orange,
  zain,
  umniah,
}

extension PhoneOperatorExtension on PhoneOperator {
  String get name {
    switch (this) {
      case PhoneOperator.orange:
        return 'Orange';
      case PhoneOperator.zain:
        return 'Zain';
      case PhoneOperator.umniah:
        return 'Umniah';
    }
  }

  String get code {
    switch (this) {
      case PhoneOperator.orange:
        return '077';
      case PhoneOperator.zain:
        return '079';
      case PhoneOperator.umniah:
        return '078';
    }
  }
}

@freezed
class PhoneNumber with _$PhoneNumber {
  const PhoneNumber._();

  const factory PhoneNumber({
    required String number,
  }) = _PhoneNumber;

  static List<PhoneNumber> mockList(int number) {
    return List.generate(
      number,
      (index) => PhoneNumber(
        // 079xxxxxxx
        number: '079${index.toString().padLeft(7, '5')}',
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

  factory PhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberFromJson(json);

  factory PhoneNumber.fromString(String phoneNumber) {
    return PhoneNumber(number: phoneNumber);
  }

  @override
  String toString() {
    return number;
  }

  Color get operatorColor {
    if (phoneOperator == PhoneOperator.umniah) {
      return const Color.fromARGB(255, 209, 214, 36);
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
