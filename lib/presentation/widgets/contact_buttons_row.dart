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

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isSignedIn = false; //FirebaseAuth.instance.currentUser != null;

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
                              "https://wa.me/962${phoneNumber.substring(1)}",
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
                            final uri = 'tel:+962${phoneNumber.substring(1)}';
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
                          obfuscatePhoneNumber(phoneNumber),
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
