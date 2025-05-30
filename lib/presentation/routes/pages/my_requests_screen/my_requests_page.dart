import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
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
    final m=Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text(m.home.myRequests),
        centerTitle: true,
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
        bottom: TabBar(
          controller: tabController,
          tabs:  [
            Tab(
              text: m.home.car_number,
            ),
            Tab(
              text: m.home.phone_numbers,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  kBottomNavigationBarHeight -
                  48, // Adjust for AppBar, TabBar, and bottom nav
              child: PlateRequestsByUserId(userId: FirebaseAuth.instance.currentUser?.uid ?? ''),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  kBottomNavigationBarHeight -
                  48, // Adjust for AppBar, TabBar, and bottom nav
              child: PhoneRequestsByUserId(userId: FirebaseAuth.instance.currentUser?.uid ?? ''),
            ),
          ),
        ],
      ),
    );
  }
}
