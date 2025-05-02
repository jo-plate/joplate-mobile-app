import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/plate_listing_details_screen/plates_details_page.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phone_number_listing_widget.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/promote_listing_button.dart';
import 'package:joplate/presentation/widgets/delete_item_popup.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';

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

        if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
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
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => DeleteListingDialog(
                        listingId: widget.listingId,
                        itemType: ItemType.phoneNumber, // or ItemType.phoneNumber, etc.
                        listingType: ListingType.ad, // or ListingType.request
                      ),
                    );
                  },
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
                PhoneNumberListingWidget(
                  item: phone,
                  hideLikeButton: true,
                  priceLabelFontSize: 24,
                  disabled: true,
                ),
                if (FirebaseAuth.instance.currentUser?.uid == phone.userId && !phone.isFeatured) ...[
                  const SizedBox(
                    height: 16,
                  ),
                  PromoteListingButton(listingId: snapshot.data!.id, itemType: ItemType.phoneNumber),
                ],
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
                          const Icon(Icons.location_on, color: Color(0xFF981C1E)),
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
