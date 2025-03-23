import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_number.dart';
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
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data();
              data['id'] = doc.id;
              return Request<PlateNumber>.fromJson(data);
            }).toList());
  }

  late final Stream<List<Request<PlateNumber>>> userPlatesStream;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: StreamBuilder<List<Request<PlateNumber>>>(
            stream: userPlatesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return PlatesRequestGrid(itemList: snapshot.data ?? []);
            }));
  }
}
