import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_requests_grid.dart';

class PhonesRequestsListWidget extends StatefulWidget {
  const PhonesRequestsListWidget({super.key});

  @override
  State<PhonesRequestsListWidget> createState() => _PhonesRequestsListWidgetState();
}

class _PhonesRequestsListWidgetState extends State<PhonesRequestsListWidget> {
  late final Stream<List<PhoneRequest>> phonesRequestsStream;

  @override
  void initState() {
    super.initState();
    phonesRequestsStream =
        FirebaseFirestore.instance.collection(phonesRequestsCollectionId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return PhoneRequest.fromJson(data);
      }).toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    phonesRequestsStream.drain();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: phonesRequestsStream,
      builder: (context, snapshot) {
        return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: PhonesRequestsGrid(itemList: snapshot.data ?? []));
      },
    );
  }
}
