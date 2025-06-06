import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_listing_widget.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/promote_listing_button.dart';
import 'package:joplate/presentation/widgets/delete_item_popup.dart';
import 'package:joplate/presentation/widgets/description_widget.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';
import 'package:joplate/presentation/widgets/other_sellers_table.dart';
import 'package:joplate/utils/log_visit.dart';
import 'package:joplate/presentation/widgets/user_details_widget.dart';

@RoutePage()
class PlatesDetailsPage extends StatefulWidget {
  const PlatesDetailsPage({super.key, @PathParam('listingId') required this.listingId});

  final String listingId;

  @override
  State<PlatesDetailsPage> createState() => _PlatesDetailsPageState();
}

class _PlatesDetailsPageState extends State<PlatesDetailsPage> {
  late final Stream<PlateListing> _plateStream;
  Timer? _timer;

  @override
  void initState() {
    print(widget.listingId);
    super.initState();
    _plateStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .doc(widget.listingId)
        .snapshots()
        .map((snapshot) => PlateListing.fromSnapshot(snapshot));

    _timer = Timer(const Duration(seconds: logVisitTimer), () {
      logVisit(
        listingId: widget.listingId,
        listingType: ListingType.ad,
        itemType: ItemType.plateNumber,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return StreamBuilder<PlateListing>(
        stream: _plateStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24, top: MediaQuery.of(context).size.height / 4),
              child: Text(
                'Error getting data for Listing',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          print(snapshot.data);
          return Scaffold(
              appBar: AppBar(
                title: Text(m.platesdetails.title),
                actions: [
                  FavoriteButton.plate(listingId: widget.listingId),
                  const SizedBox(
                    width: 16,
                  ),
                  if (FirebaseAuth.instance.currentUser?.uid == snapshot.data!.userId) ...[
                    GestureDetector(
                      child: const Icon(Icons.edit_outlined),
                      onTap: () {
                        AutoRouter.of(context).push(EditPlateListingRoute(listing: snapshot.data!));
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
                            itemType: ItemType.plateNumber, // or ItemType.phoneNumber, etc.
                            listingType: ListingType.ad, // or ListingType.request
                            plateNumber: snapshot.data!.item,
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PlateNumberListingWidget(
                      disabled: true,
                      item: snapshot.data!,
                      hideLikeButton: true,
                      priceLabelFontSize: 24,
                    ),
                    if (snapshot.data!.userId == FirebaseAuth.instance.currentUser?.uid &&
                        snapshot.data!.expiresAt != null &&
                        !snapshot.data!.isDisabled &&
                        !snapshot.data!.isSold) ...[
                      const SizedBox(
                        height: 8,
                      ),
                      if (snapshot.data!.isExpired)
                        Text(
                          m.home.expired,
                          style: const TextStyle(fontSize: 14, color: Colors.red),
                        )
                      else ...[
                        Text(
                          m.listingdetails.expires_on(snapshot.data!.expiresAt!.toLocal().toString()),
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        if (snapshot.data!.isFeatured)
                          Text(
                            m.listingdetails.featured_until(snapshot.data!.featuredUntil!.toLocal().toString()),
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                      ]
                    ],
                    if (!(snapshot.data?.isFeatured ?? false) &&
                        (FirebaseAuth.instance.currentUser?.uid ?? '') == snapshot.data!.userId &&
                        !snapshot.data!.isSold) ...[
                      const SizedBox(height: 8),
                      PromoteListingButton(listingId: snapshot.data!.id, itemType: ItemType.plateNumber),
                    ],
                    const SizedBox(height: 16),
                    if (snapshot.data!.description.isNotEmpty) ...[
                      DescriptionWidget(description: snapshot.data!.description),
                      const SizedBox(height: 16),
                    ],
                    UserDetailsWidget(
                      userId: snapshot.data!.userId,
                      visits: snapshot.data!.visits,
                      title: m.platesdetails.originally_posted_by,
                      showVisits: FirebaseAuth.instance.currentUser?.uid == snapshot.data?.userId,
                      showDisclaimer: true,
                    ),
                    const SizedBox(height: 16),
                    OtherSellersTable(
                      userId: snapshot.data!.userId,
                      plateNumber: snapshot.data!.item,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ));
        });
  }
}
