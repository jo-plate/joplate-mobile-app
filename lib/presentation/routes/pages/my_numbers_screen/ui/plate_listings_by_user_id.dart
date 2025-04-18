import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_listing_grid.dart';

class PlateListingsByUserId extends StatefulWidget {
  const PlateListingsByUserId({super.key, required this.userId});

  final String userId;

  @override
  State<PlateListingsByUserId> createState() => _PlateListingsByUserIdState();
}

class _PlateListingsByUserIdState extends State<PlateListingsByUserId> {
  @override
  void initState() {
    super.initState();
    userPlatesStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('userId', isEqualTo: widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PlateListing.fromSnapshot(doc))
            .toList());
  }

  late final Stream<List<PlateListing>> userPlatesStream;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: StreamBuilder<List<PlateListing>>(
            stream: userPlatesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return PlatesListingsGrid(itemList: snapshot.data ?? []);
            }));
  }
}
