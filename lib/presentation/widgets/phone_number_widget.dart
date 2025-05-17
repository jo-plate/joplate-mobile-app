import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/gen/assets.gen.dart';

class PhoneNumberWidget extends StatelessWidget {
  final PhoneNumber phoneNumber;

  const PhoneNumberWidget({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final fontSize = width * 0.14; // scales with container width
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.hardEdge,
          children: [
            if (phoneNumber.phoneOperator == PhoneOperator.zain)
              Assets.images.zainPhonebg.image(
                fit: BoxFit.contain,
              )
            else if (phoneNumber.phoneOperator == PhoneOperator.orange)
              Assets.images.orangePhonebg.image(
                fit: BoxFit.contain,
              )
            else if (phoneNumber.phoneOperator == PhoneOperator.umniah)
              if (isDark)
                Assets.images.umniahPhonebgDark.image(
                  fit: BoxFit.contain,
                )
              else
                Assets.images.umniahPhonebg.image(
                  fit: BoxFit.contain,
                ),
            Positioned(
              bottom: width * 0.02,
              left: 0,
              right: 0,
              child: Text(
                phoneNumber.number,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: "UkNumberPlate",
                  letterSpacing: 2,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
