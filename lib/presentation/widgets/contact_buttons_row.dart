import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/utils/strings.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactButtonsRow extends StatelessWidget {
  final String phoneNumber;

  const ContactButtonsRow({
    super.key,
    required this.phoneNumber,
  });

  String _normalizePhoneNumber(String number) {
    // Remove any spaces or special characters
    String cleanNumber = number.replaceAll(RegExp(r'[^\d+]'), '');

    // Handle different cases
    if (cleanNumber.startsWith('+')) {
      // Already has country code, keep as is
      return cleanNumber;
    } else if (cleanNumber.startsWith('962')) {
      // Has Jordan country code without +, add it
      return '+$cleanNumber';
    } else if (cleanNumber.startsWith('07') && cleanNumber.length == 10) {
      // Jordan mobile number with leading 0
      return '+962${cleanNumber.substring(1)}';
    } else if (cleanNumber.length == 8) {
      // 8-digit number, assume it's a Jordan mobile number
      return '+9627$cleanNumber';
    }

    // Default case: assume it's a Jordan number and add the country code
    return '+962$cleanNumber';
  }

  String _getWhatsAppNumber(String normalizedNumber) {
    // Remove the + for WhatsApp
    return normalizedNumber.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isSignedIn = FirebaseAuth.instance.currentUser != null;
    final normalizedNumber = _normalizePhoneNumber(phoneNumber);
    final whatsappNumber = _getWhatsAppNumber(normalizedNumber);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: isSignedIn
                        ? () {
                            launchUrlString(
                              "https://wa.me/$whatsappNumber",
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        : null,
                    borderRadius: BorderRadius.circular(8),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'WhatsApp',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF981C1E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: isSignedIn
                        ? () async {
                            final uri = 'tel:$normalizedNumber';
                            if (await canLaunchUrlString(uri)) {
                              await launchUrlString(uri);
                            } else {
                              throw 'Could not launch dialer';
                            }
                          }
                        : null,
                    borderRadius: BorderRadius.circular(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          obfuscatePhoneNumber(normalizedNumber),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (!isSignedIn)
            Positioned.fill(
              child: InkWell(
                onTap: () {
                  AutoRouter.of(context).push(const AuthRoute());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      m.auth.signin_to_contact,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
