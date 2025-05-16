import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/my_numbers_screen/ui/phone_listings_by_user_id.dart';
import 'package:joplate/presentation/routes/pages/my_numbers_screen/ui/plate_listings_by_user_id.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class MyNumbersPage extends StatefulWidget {
  const MyNumbersPage({super.key});

  @override
  State<MyNumbersPage> createState() => _MyNumbersPageState();
}

class _MyNumbersPageState extends State<MyNumbersPage> with SingleTickerProviderStateMixin {
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
        title:  Text(m.home.mynumbers),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30,
            onPressed: () {
              if (tabController.index == 0) {
                context.router.push(const AddPlateNumberRoute());
              } else {
                context.router.push(const AddPhoneNumberRoute());
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TabBarView(
          controller: tabController,
          children: [
            PlateListingsByUserId(userId: FirebaseAuth.instance.currentUser?.uid ?? ''),
            PhoneListingsByUserId(userId: FirebaseAuth.instance.currentUser?.uid ?? ''),
          ],
        ),
      ),
    );
  }
}
