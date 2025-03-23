import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_request_grid.dart';

class PlatesRequestsWidget extends StatefulWidget {
  const PlatesRequestsWidget({super.key});

  @override
  State<PlatesRequestsWidget> createState() => _PlatesRequestsWidgetState();
}

class _PlatesRequestsWidgetState extends State<PlatesRequestsWidget> {
  late final Stream<List<Request<PlateNumber>>> platesRequestsStream;

  @override
  void initState() {
    super.initState();
    platesRequestsStream =
        FirebaseFirestore.instance.collection(platesRequestsCollectionId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return Request<PlateNumber>.fromJson(data);
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
        return SingleChildScrollView(child: PlatesRequestGrid(itemList: snapshot.data ?? []));
      },
    );
  }
}
