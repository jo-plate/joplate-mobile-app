import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_request_grid.dart';

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
        .where('userId', isEqualTo: widget.userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return PlateRequest.fromSnapshot(doc);
            }).toList());
  }

  late final Stream<List<PlateRequest>> userPlatesStream;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: StreamBuilder<List<PlateRequest>>(
            stream: userPlatesStream,
            builder: (context, snapshot) {
              print(snapshot.error);

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return PlatesRequestGrid(itemList: snapshot.data ?? []);
            }));
  }
}
