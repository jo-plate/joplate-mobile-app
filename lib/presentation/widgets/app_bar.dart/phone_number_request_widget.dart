import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_listing_widget.dart';
import 'package:joplate/presentation/widgets/phone_number_widget.dart';
import 'package:joplate/presentation/widgets/top_ribbon.dart';

class PhoneNumberRequestWidget extends StatelessWidget {
  final PhoneRequest item;
  final double priceLabelFontSize;
  final bool disabled;
  final double aspectRatio;

  const PhoneNumberRequestWidget(
      {super.key, required this.item, this.priceLabelFontSize = 16, this.disabled = false, this.aspectRatio = 1.51});

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Center(
        child: GestureDetector(
          onTap: disabled
              ? null
              : () {
                  AutoRouter.of(context).push(PhoneRequestDetailsRoute(phoneNumberRequestId: item.id));
                },
          child: Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.hardEdge,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isDark ? const Color(0xFF3D4266) : Colors.grey[500]!,
                    width: 2,
                  ),
                  color: isDark ? const Color(0xFF252A41) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: PhoneNumberWidget(phoneNumber: item.item),
                          ),
                          _buildPriceLabel(context),
                          if (item.createdAt != null)
                            CreatedAtLabelWidget(
                              createdAt: item.createdAt!,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (item.isDisabled || item.isExpired)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? Colors.black.withOpacity(0.75) : Colors.grey.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              if (item.isDisabled)
                TopRibbon(
                  backgroundColor: Colors.black,
                  text: m.home.disabled,
                  textColor: Colors.white,
                )
              else if (item.isExpired)
                TopRibbon(
                  backgroundColor: Colors.black,
                  text: m.home.expired,
                  textColor: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceLabel(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Text(
      'Requested',
      style: TextStyle(
        fontSize: priceLabelFontSize,
        fontFamily: 'Mandatory',
        fontWeight: FontWeight.w700,
        color: isDark ? Colors.white70 : const Color(0xFF981C1E),
      ),
      maxLines: 1,
    );
  }
}
