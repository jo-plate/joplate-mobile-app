import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/routes/pages/requests_screen/ui/phones_requests_list_widget.dart';
import 'package:joplate/presentation/routes/pages/requests_screen/ui/plates_requests_list_widget.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_listing_grid.dart';

@RoutePage()
class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> with SingleTickerProviderStateMixin {
  late final Stream<List<Request<PlateNumber>>> platesRequestsStream;
  late final Stream<List<Request<PhoneNumber>>> phonesRequestsStream;
  late final TabController tabController;

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
    phonesRequestsStream =
        FirebaseFirestore.instance.collection(phonesRequestsCollectionId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return Request<PhoneNumber>.fromJson(data);
      }).toList();
    });

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    platesRequestsStream.drain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              text: 'Car Numbers',
            ),
            Tab(
              text: 'Phone Numbers',
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30,
            color: const Color(0xFF981C1E),
            onPressed: () {
              if (tabController.index == 0) {
                context.router.push(const AddPlateRequestRoute());
              } else {
                context.router.push(const AddPhoneRequestRoute());
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: TabBarView(
          controller: tabController,
          children: const [
            PlatesRequestsListWidget(),
            PhonesRequestsListWidget(),
          ],
        ),
      ),
    );
  }
}
