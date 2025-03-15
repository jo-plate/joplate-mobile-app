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
    @Default([]) List<ListingV2> ads,
  }) = _PhoneNumber;

  static List<PhoneNumber> mockList(int number) {
    return List.generate(
      number,
      (index) => PhoneNumber(
        number: (10044 + index).toString(),
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

  @override
  String toString() {
    return number;
  }
}
