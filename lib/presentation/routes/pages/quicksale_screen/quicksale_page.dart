import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_dialer/flutter_phone_dialer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_profile.dart';

import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class QuicksalePage extends StatelessWidget {
  const QuicksalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickSale'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SellerDetails(userId: quicksaleUserId),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SellerDetails extends StatefulWidget {
  const SellerDetails({super.key, required this.userId});
  final String userId;

  @override
  State<SellerDetails> createState() => _SellerDetailsState();
}

class _SellerDetailsState extends State<SellerDetails> {
  late final Stream<UserProfile> userProfileStream;

  @override
  void initState() {
    super.initState();
    userProfileStream =
        FirebaseFirestore.instance.collection(userProfileCollectionId).doc(widget.userId).snapshots().map((snapshot) {
      return UserProfile.fromJson(snapshot.data() ?? {});
    });
  }

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
      child: StreamBuilder<UserProfile>(
          stream: userProfileStream,
          builder: (context, snapshot) {
            final userProfile = snapshot.data;
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (userProfile == null) {
              return const Text('User not found');
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Want us to find a buyer for your plate number? We can help you with that.',
                        style: TextStyle(
                          // fontSize: 18,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                          Text(
                            userProfile.displayName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2C3E50),
                            ),
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
                            launchUrlString("https://wa.me/${userProfile.phonenumber}",
                                mode: LaunchMode.externalApplication);
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
                          onTap: () {
                            FlutterPhoneDialer.dialNumber(userProfile.phonenumber);
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
            );
          }),
    );
  }
}

class RequestedByWidgget extends StatefulWidget {
  const RequestedByWidgget({super.key, required this.userId});
  final String userId;

  @override
  State<RequestedByWidgget> createState() => _RequestedByWidggetState();
}

class _RequestedByWidggetState extends State<RequestedByWidgget> {
  late final Stream<UserProfile> userProfileStream;

  @override
  void initState() {
    super.initState();
    userProfileStream =
        FirebaseFirestore.instance.collection(userProfileCollectionId).doc(widget.userId).snapshots().map((snapshot) {
      return UserProfile.fromJson(snapshot.data() ?? {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: StreamBuilder<UserProfile>(
          stream: userProfileStream,
          builder: (context, snapshot) {
            final userProfile = snapshot.data;
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (userProfile == null) {
              return const Text('User not found');
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Requested by',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        userProfile.displayName,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          launchUrlString("https://wa.me/${userProfile.phonenumber}",
                              mode: LaunchMode.externalApplication);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        icon: const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Whatsapp',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Phone Call Button
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          FlutterPhoneDialer.dialNumber(userProfile.phonenumber);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        icon: const Icon(Icons.phone, color: Colors.white),
                        label: Text(
                          userProfile.phonenumber,
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
