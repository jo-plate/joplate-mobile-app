import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/social_link.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  final double iconSize;
  final Color? iconColor;
  final double spacing;

  const SocialLinks({
    super.key,
    this.iconSize = 24.0,
    this.iconColor,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(socialLinksCollectionId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SizedBox.shrink();
        }

        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final socialLinks =
            snapshot.data!.docs.map((doc) => SocialLink.fromJson(doc.data() as Map<String, dynamic>)).toList();

        if (socialLinks.isEmpty) {
          return const SizedBox.shrink();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: socialLinks.map((link) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing / 2),
              child: IconButton(
                icon: _getIcon(link.icon),
                iconSize: iconSize,
                color: const Color(0xFF981C1E),
                onPressed: () => _launchUrl(link.link),
                tooltip: link.label,
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _getIcon(String iconName) {
    // Map common social media icons
    switch (iconName.toLowerCase()) {
      case 'facebook':
        return const FaIcon(FontAwesomeIcons.facebook);
      case 'twitter':
        return const FaIcon(FontAwesomeIcons.twitter);
      case 'instagram':
        return const FaIcon(FontAwesomeIcons.instagram);
      case 'linkedin':
        return const FaIcon(FontAwesomeIcons.linkedin);
      case 'youtube':
        return const FaIcon(FontAwesomeIcons.youtube);
      case 'whatsapp':
        return const FaIcon(FontAwesomeIcons.whatsapp);
      case 'telegram':
        return const FaIcon(FontAwesomeIcons.telegram);
      case 'email':
        return const FaIcon(FontAwesomeIcons.envelope);
      case 'phone':
        return const FaIcon(FontAwesomeIcons.phone);
      case 'web':
        return const FaIcon(FontAwesomeIcons.globe);
      default:
        return const FaIcon(FontAwesomeIcons.link);
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
