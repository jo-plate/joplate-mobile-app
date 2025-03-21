import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_listing_grid.dart';

class PlateRequestsByUserId extends StatefulWidget {
  const PlateRequestsByUserId({super.key, required this.userId});

  final String userId;

  @override
  State<PlateRequestsByUserId> createState() => _PlateRequestsByUserIdState();
}

class _PlateRequestsByUserIdState extends State<PlateRequestsByUserId> {
  @override
  void initState() {
    super.initState();
    userPlatesStream = FirebaseFirestore.instance
        .collection(platesRequestsCollectionId)
        .where('adsUserIds', arrayContains: widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PlateNumber.fromJson(doc.data())).toList());
  }

  late final Stream<List<PlateNumber>> userPlatesStream;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: StreamBuilder<List<PlateNumber>>(
            stream: userPlatesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return PlatesListingsGrid(itemList: snapshot.data ?? []);
            }));
  }
}
