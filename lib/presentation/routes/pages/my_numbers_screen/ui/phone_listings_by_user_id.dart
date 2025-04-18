import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_listing_grid.dart';

class PhoneListingsByUserId extends StatefulWidget {
  const PhoneListingsByUserId({super.key, required this.userId});

  final String userId;

  @override
  State<PhoneListingsByUserId> createState() => _PhoneListingsByUserIdState();
}

class _PhoneListingsByUserIdState extends State<PhoneListingsByUserId> {
  @override
  void initState() {
    super.initState();
    userPhonesStream = FirebaseFirestore.instance
        .collection(phoneNumbersCollectionId)
        .where('userId', isEqualTo: widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PhoneListing.fromSnapshot(doc))
            .toList());
  }

  late final Stream<List<PhoneListing>> userPhonesStream;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: StreamBuilder<List<PhoneListing>>(
            stream: userPhonesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return PhonesListingGrid(itemList: snapshot.data ?? []);
            }));
  }
}
