import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/requests_screen/ui/phones_requests_list_widget.dart';
import 'package:joplate/presentation/routes/pages/requests_screen/ui/plates_requests_list_widget.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> with SingleTickerProviderStateMixin {
  late final Stream<List<PlateRequest>> platesRequestsStream;
  late final Stream<List<PhoneRequest>> phonesRequestsStream;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    platesRequestsStream = FirebaseFirestore.instance
        .collection(platesRequestsCollectionId)
        .where('isDisabled', isEqualTo: false)
        // .where('expiresAt', isGreaterThan: DateTime.now())
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        print(doc.data());
        return PlateRequest.fromSnapshot(doc);
      }).toList();
    });
    phonesRequestsStream = FirebaseFirestore.instance
        .collection(phonesRequestsCollectionId)
        .where('isDisabled', isEqualTo: false)
        // .where('expiresAt', isGreaterThan: DateTime.now())
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return PhoneRequest.fromSnapshot(doc);
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
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(m.home.requests),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              text: m.home.car_number,
            ),
            Tab(
              text: m.home.phone_numbers,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30,
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
      body: TabBarView(
        controller: tabController,
        children: const [
          PlatesRequestsListWidget(),
          PhonesRequestsListWidget(),
        ],
      ),
    );
  }
}
