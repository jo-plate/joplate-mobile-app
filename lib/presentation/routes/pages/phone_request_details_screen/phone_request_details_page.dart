import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_dialer/flutter_phone_dialer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phone_number_request_widget.dart';
import 'package:joplate/presentation/widgets/delete_item_popup.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class PhoneRequestDetailsPage extends StatefulWidget {
  const PhoneRequestDetailsPage({super.key, required this.phoneNumberRequestId});

  final String phoneNumberRequestId;

  @override
  State<PhoneRequestDetailsPage> createState() => _PhoneRequestDetailsPageState();
}

class _PhoneRequestDetailsPageState extends State<PhoneRequestDetailsPage> {
  late final Stream<PhoneRequest> phoneRequestStream;
  @override
  void initState() {
    super.initState();
    phoneRequestStream = FirebaseFirestore.instance
        .collection(phonesRequestsCollectionId)
        .doc(widget.phoneNumberRequestId)
        .snapshots()
        .map((snapshot) {
      return PhoneRequest.fromSnapshot(snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PhoneRequest>(
        stream: phoneRequestStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return const Center(child: Text('Request not found'));
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Phone Number Request'),
              actions: [
                if (FirebaseAuth.instance.currentUser?.uid == snapshot.data!.userId) ...[
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      context.router.push(EditPhoneRequestRoute(request: snapshot.data!));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => DeleteListingDialog(
                          listingId: widget.phoneNumberRequestId,
                          itemType: ItemType.plateNumber, // or ItemType.phoneNumber, etc.
                          listingType: ListingType.request,
                        ),
                      );
                    },
                  ),
                ]
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PhoneNumberRequestWidget(
                    item: snapshot.data!,
                    priceLabelFontSize: 24,
                    aspectRatio: 1.5,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  RequestedByWidgget(userId: snapshot.data!.userId),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Important Note:',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.payments, color: Color(0xFF981C1E)),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Don't transfer money online",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF981C1E)),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Meet the seller in person",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
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
