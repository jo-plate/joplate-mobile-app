import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phone_number_request_widget.dart';
import 'package:joplate/presentation/widgets/delete_item_popup.dart';
import 'package:joplate/presentation/widgets/description_widget.dart';
import 'package:joplate/presentation/widgets/user_details_widget.dart';
import 'package:joplate/utils/log_visit.dart';
import 'package:joplate/presentation/widgets/disclaimer_widget.dart';

@RoutePage()
class PhoneRequestDetailsPage extends StatefulWidget {
  const PhoneRequestDetailsPage({super.key, required this.phoneNumberRequestId});

  final String phoneNumberRequestId;

  @override
  State<PhoneRequestDetailsPage> createState() => _PhoneRequestDetailsPageState();
}

class _PhoneRequestDetailsPageState extends State<PhoneRequestDetailsPage> {
  late final Stream<PhoneRequest> phoneRequestStream;
  Timer? _timer;
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

    _timer = Timer(const Duration(seconds: logVisitTimer), () {
      logVisit(
        listingId: widget.phoneNumberRequestId,
        listingType: ListingType.request,
        itemType: ItemType.phoneNumber,
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
                          listingId: snapshot.data!.id,
                          itemType: ItemType.phoneNumber, // or ItemType.phoneNumber, etc.
                          listingType: ListingType.request,
                          phoneNumber: snapshot.data!.item,
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
                    disabled: true,
                    aspectRatio: 1.9,
                  ),
                  if (snapshot.data!.userId == FirebaseAuth.instance.currentUser?.uid &&
                      snapshot.data!.expiresAt != null &&
                      !snapshot.data!.isDisabled) ...[
                    const SizedBox(
                      height: 16,
                    ),
                    if (snapshot.data!.isExpired)
                      Text(
                        m.home.expired,
                        style: const TextStyle(fontSize: 14, color: Colors.red),
                      )
                    else
                      Text(
                        m.listingdetails.expires_on(snapshot.data!.expiresAt!.toLocal()),
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
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
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 20),
                  const DisclaimerWidget(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }
}
