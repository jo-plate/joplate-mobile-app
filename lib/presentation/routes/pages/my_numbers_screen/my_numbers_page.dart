import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_listing_grid.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class MyNumbersPage extends StatefulWidget {
  const MyNumbersPage({super.key});

  @override
  State<MyNumbersPage> createState() => _MyNumbersPageState();
}

class _MyNumbersPageState extends State<MyNumbersPage> with SingleTickerProviderStateMixin {
// init firestore streams
  late final Stream<List<PlateNumber>> myPlateListingsStream;

  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    myPlateListingsStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('adsUserIds', arrayContains: FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PlateNumber.fromJson(doc.data())).toList());

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    myPlateListingsStream.drain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Numbers'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30,
            color: const Color(0xFF981C1E),
            onPressed: () {
              context.router.push(const AddPlateNumberRoute());
            },
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          // indicator: BoxDecoration(
          //   borderRadius: BorderRadius.circular(50),
          //   color: const Color(0xFF981C1E),
          // ),
          // tabAlignment: TabAlignment.center,
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: StreamBuilder<List<PlateNumber>>(
            stream: myPlateListingsStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('An error occurred'));
              }

              if (snapshot.data == null) {
                return const Center(child: Text('No favorites found'));
              }

              return TabBarView(
                controller: tabController,
                children: [
                  SingleChildScrollView(child: PlatesListingsGrid(itemList: snapshot.data ?? [])),
                  SingleChildScrollView(child: PlatesListingsGrid(itemList: snapshot.data ?? [])),
                ],
              );
            }),
      ),
    );
  }
}
