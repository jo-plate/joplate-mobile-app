// phone number model

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/listing_v2.dart';

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
    ListingV2? ad,
  }) = _PhoneNumber;

  static List<PhoneNumber> mockList(int number) {
    return List.generate(
      number,
      (index) => PhoneNumber(
        // 079xxxxxxx
        number: '079${index.toString().padLeft(7, '5')}',
        ad: ListingV2.mockAd(),
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
}
