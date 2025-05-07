import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/phone_request_details_screen/phone_request_details_page.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_request_widget.dart';
import 'package:joplate/presentation/widgets/delete_item_popup.dart';

@RoutePage()
class PlateRequestDetailsPage extends StatefulWidget {
  const PlateRequestDetailsPage({super.key, @PathParam('requestId') required this.requestId});

  final String requestId;

  @override
  State<PlateRequestDetailsPage> createState() => _PlateRequestDetailsPageState();
}

class _PlateRequestDetailsPageState extends State<PlateRequestDetailsPage> {
  late final Stream<PlateRequest> _plateStream;

  @override
  void initState() {
    super.initState();
    _plateStream = FirebaseFirestore.instance
        .collection(platesRequestsCollectionId)
        .doc(widget.requestId)
        .snapshots()
        .map((snapshot) => PlateRequest.fromSnapshot(snapshot));
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return StreamBuilder<PlateRequest>(
        stream: _plateStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24, top: MediaQuery.of(context).size.height / 4),
              child: Text(
                'Error getteing data for Request',
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

          if (snapshot.data == null) {
            return const Center(
              child: Text(
                'No data found',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return Scaffold(
              appBar: AppBar(
                title: const Text('Plate Request Details'),
                actions: [
                  if (FirebaseAuth.instance.currentUser?.uid == snapshot.data!.userId) ...[
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        context.router.push(EditPlateRequestRoute(request: snapshot.data!));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => DeleteListingDialog(
                            listingId: widget.requestId,
                            itemType: ItemType.plateNumber,
                            listingType: ListingType.request,
                            plateNumber: snapshot.data!.item,
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
                    PlateNumberRequestWidget(
                      item: snapshot.data!,
                      disabled: true,
                      priceLabelFontSize: 24,
                      aspectRatio: 2.1,
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
                    RequestedByWidgget(userId: snapshot.data!.userId),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                  ],
                ),
              ));
        });
  }
}
