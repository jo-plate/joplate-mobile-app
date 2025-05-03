import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class QuicksalePage extends StatefulWidget {
  const QuicksalePage({super.key});

  @override
  State<QuicksalePage> createState() => _QuicksalePageState();
}

class _QuicksalePageState extends State<QuicksalePage> {
  late final Stream<List<UserProfile>> _profilesStream;

  @override
  void initState() {
    super.initState();
    _profilesStream = FirebaseFirestore.instance
        .collection(quicksaleProfilesCollectionId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => UserProfile.fromSnapshot(doc)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(m.quicksale.title),
      ),
      body: StreamBuilder<List<UserProfile>>(
        stream: _profilesStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading profiles'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final profiles = snapshot.data ?? [];

          if (profiles.isEmpty) {
            return const Center(child: Text('No sellers available'));
          }

          return SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                m.quicksale.description,
                style: const TextStyle(
                  // color: Color(0xFF2C3E50),
                ),
              ),
              ...profiles
                  .map((profile) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: SellerDetails(userProfile: profile),
                      ))
                  .toList(),
            ]),
          );
        },
      ),
    );
  }
}

class SellerDetails extends StatelessWidget {
  const SellerDetails({super.key, required this.userProfile});
  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.speed,
                  color: Color(0xFF981C1E),
                  size: 26,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          userProfile.displayName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(
                          Icons.verified,
                          color: Colors.blue.shade600,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      launchUrlString(
                        "https://wa.me/${userProfile.phonenumber.substring(1)}",
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'WhatsApp',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
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
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF981C1E).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () async {
                      final uri = 'tel:${userProfile.phonenumber}';
                      if (await canLaunchUrlString(uri)) {
                        await launchUrlString(uri);
                      } else {
                        throw 'Could not launch dialer';
                      }
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Color(0xFF981C1E),
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          userProfile.phonenumber,
                          style: const TextStyle(
                            color: Color(0xFF981C1E),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
