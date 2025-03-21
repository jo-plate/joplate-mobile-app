import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/presentation/routes/pages/my_requests_screen/ui/phone_requests_by_user_id.dart';
import 'package:joplate/presentation/routes/pages/my_requests_screen/ui/plate_requests_by_user_id.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class MyRequestsPage extends StatefulWidget {
  const MyRequestsPage({super.key});

  @override
  State<MyRequestsPage> createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Requests'),
        centerTitle: true,
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TabBarView(
          controller: tabController,
          children: [
            PlateRequestsByUserId(userId: FirebaseAuth.instance.currentUser?.uid ?? ''),
            PhoneRequestsByUserId(userId: FirebaseAuth.instance.currentUser?.uid ?? ''),
          ],
        ),
      ),
    );
  }
}
