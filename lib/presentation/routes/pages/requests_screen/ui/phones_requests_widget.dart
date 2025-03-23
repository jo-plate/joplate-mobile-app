import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_listing_grid.dart';

class PhonesRequestsWidget extends StatefulWidget {
  const PhonesRequestsWidget({super.key});

  @override
  State<PhonesRequestsWidget> createState() => _PhonesRequestsWidgetState();
}

class _PhonesRequestsWidgetState extends State<PhonesRequestsWidget> {
  late final Stream<List<Request<PhoneNumber>>> phonesRequestsStream;

  @override
  void initState() {
    super.initState();
    phonesRequestsStream =
        FirebaseFirestore.instance.collection(platesRequestsCollectionId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return Request<PhoneNumber>.fromJson(data);
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
            child: PhonesListingGrid(itemList: snapshot.data?.map((e) => e.phoneNumber!).toList() ?? []));
      },
    );
  }
}
