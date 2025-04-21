import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_dialer/flutter_phone_dialer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phone_number_listing_widget.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/promote_listing_button.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class PhoneDetailsPage extends StatefulWidget {
  const PhoneDetailsPage({
    super.key,
    @PathParam('listingId') required this.listingId,
  });

  final String listingId;

  @override
  State<PhoneDetailsPage> createState() => _PhoneDetailsPageState();
}

class _PhoneDetailsPageState extends State<PhoneDetailsPage> {
  late final Stream<PhoneListing> _phoneStream;

  @override
  void initState() {
    super.initState();
    _phoneStream = FirebaseFirestore.instance
        .collection(phoneNumbersCollectionId)
        .doc(widget.listingId)
        .snapshots()
        .map((snap) => PhoneListing.fromSnapshot(snap));
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return StreamBuilder<PhoneListing>(
      stream: _phoneStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Failed to load phone listing: ${snapshot.error}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final phone = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: Text(m.phonedetails.title),
            actions: [
              FavoriteButton.phone(listingId: widget.listingId),
              const SizedBox(
                width: 16,
              ),
              if (phone.userId == FirebaseAuth.instance.currentUser?.uid) ...[
                GestureDetector(
                  child: const Icon(Icons.edit_outlined),
                  onTap: () {
                    AutoRouter.of(context).push(
                      EditPhoneListingRoute(listing: phone),
                    );
                  },
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  child: const Icon(Icons.delete_outline),
                  onTap: () {},
                ),
                const SizedBox(
                  width: 16,
                ),
              ]
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 170,
                  child: PhoneNumberListingWidget(
                    item: phone,
                    hideLikeButton: true,

                    priceLabelFontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                PromoteListingButton(
                    listingId: snapshot.data!.id,
                    itemType: ItemType.phoneNumber),
                const SizedBox(
                  height: 16,
                ),
                SellerDetails(userId: phone.userId),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        m.phonedetails.important_note,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.payments, color: Color(0xFF981C1E)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              m.phonedetails.dont_transfer_money,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Color(0xFF981C1E)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              m.phonedetails.meet_in_person,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        );
      },
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
    userProfileStream = FirebaseFirestore.instance
        .collection(userProfileCollectionId)
        .doc(widget.userId)
        .snapshots()
        .map((snapshot) {
      return UserProfile.fromJson(snapshot.data() ?? {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
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
                Text(
                  m.sellerdetails.about_seller,
                  style: const TextStyle(fontSize: 16),
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
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
                          launchUrlString(
                              "https://wa.me/${userProfile.phonenumber}",
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
                          FlutterPhoneDialer.dialNumber(
                              userProfile.phonenumber);
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
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
