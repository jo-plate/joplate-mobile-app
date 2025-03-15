import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/routes/pages/home_page/home_tab/ui/plates_listing_grid.dart';

@RoutePage()
class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> with SingleTickerProviderStateMixin {
  late final Stream<List<Listing<PlateNumber>>> platesRequestsStream;
  late final Stream<List<Listing<PhoneNumber>>> phonesRequestsStream;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    platesRequestsStream =
        FirebaseFirestore.instance.collection(platesRequestsCollectionId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return Listing<PlateNumber>.fromJson(data);
      }).toList();
    });
    phonesRequestsStream =
        FirebaseFirestore.instance.collection(phonesRequestsCollectionId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return Listing<PhoneNumber>.fromJson(data);
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: TabBarView(
          controller: tabController,
          children: [
            StreamBuilder(
              stream: platesRequestsStream,
              builder: (context, snapshot) {
                return SingleChildScrollView(
                    child: PlatesListingsGrid(itemList: snapshot.data?.map((e) => e.plateNumber!).toList() ?? []));
              },
            ),
            StreamBuilder(
              stream: platesRequestsStream,
              builder: (context, snapshot) {
                return SingleChildScrollView(
                    child: PlatesListingsGrid(itemList: snapshot.data?.map((e) => e.plateNumber!).toList() ?? []));
              },
            ),
          ],
        ),
      ),
    );
  }
}
