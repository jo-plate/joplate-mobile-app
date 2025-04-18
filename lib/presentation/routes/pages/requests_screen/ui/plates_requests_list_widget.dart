import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_request_grid.dart';

class PlatesRequestsListWidget extends StatefulWidget {
  const PlatesRequestsListWidget({super.key});

  @override
  State<PlatesRequestsListWidget> createState() => _PlatesRequestsListWidgetState();
}

class _PlatesRequestsListWidgetState extends State<PlatesRequestsListWidget> {
  late final Stream<List<PlateRequest>> platesRequestsStream;

  @override
  void initState() {
    super.initState();
    platesRequestsStream =
        FirebaseFirestore.instance.collection(platesRequestsCollectionId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return PlateRequest.fromJson(data);
      }).toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    platesRequestsStream.drain();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: platesRequestsStream,
      builder: (context, snapshot) {
        return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: PlatesRequestGrid(itemList: snapshot.data ?? []));
      },
    );
  }
}
