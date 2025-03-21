import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_listing_grid.dart';

class PhoneRequestsByUserId extends StatefulWidget {
  const PhoneRequestsByUserId({super.key, required this.userId});

  final String userId;

  @override
  State<PhoneRequestsByUserId> createState() => _PhoneRequestsByUserIdState();
}

class _PhoneRequestsByUserIdState extends State<PhoneRequestsByUserId> {
  @override
  void initState() {
    super.initState();
    userPhonesStream = FirebaseFirestore.instance
        .collection(phonesRequestsCollectionId)
        .where('adsUserIds', arrayContains: widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PhoneNumber.fromJson(doc.data())).toList());
  }

  late final Stream<List<PhoneNumber>> userPhonesStream;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: StreamBuilder<List<PhoneNumber>>(
            stream: userPhonesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return PhonesListingGrid(itemList: snapshot.data ?? []);
            }));
  }
}
