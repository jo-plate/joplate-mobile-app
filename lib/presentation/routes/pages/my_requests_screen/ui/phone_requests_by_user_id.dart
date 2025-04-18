import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_requests_grid.dart';

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
        .where('userId', isEqualTo: widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data();
              data['id'] = doc.id;
              return PhoneRequest.fromJson(data);
            }).toList());
  }

  late final Stream<List<PhoneRequest>> userPhonesStream;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        child: StreamBuilder<List<PhoneRequest>>(
            stream: userPhonesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return PhonesRequestsGrid(itemList: snapshot.data ?? []);
            }));
  }
}
