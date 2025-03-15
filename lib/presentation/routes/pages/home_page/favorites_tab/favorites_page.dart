import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/user_favorites.dart';
import 'package:joplate/presentation/routes/pages/home_page/home_tab/ui/plates_listing_grid.dart';

@RoutePage()
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> with SingleTickerProviderStateMixin {
// init firestore streams
  late final Stream<UserFavorites> favoritesStream;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    favoritesStream = FirebaseFirestore.instance
        .collection(favoritesCollectionId)
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .map((snapshot) {
      print(snapshot.data());
      return UserFavorites.fromJson(snapshot.data() ?? {});
    }).asyncMap((snapshot) async {
      print(snapshot);
      final List<PlateNumber> plates = await Future.wait(
        snapshot.favoritePlates.map((id) async {
          final plate = await FirebaseFirestore.instance.collection(carPlatesCollectionId).doc(id.toString()).get();

          final plateDict = plate.data() ?? {};
          plateDict['id'] = id.toString();
          return PlateNumber.fromJson(plateDict);
        }),
      );
      final List<PhoneNumber> phones = await Future.wait(
        snapshot.favoritePhones.map((id) async {
          final phone = await FirebaseFirestore.instance.collection(phoneNumbersCollectionId).doc(id.number).get();
          final phoneDict = phone.data()!;
          phoneDict['id'] = id;
          return PhoneNumber.fromJson(phoneDict);
        }),
      );
      return snapshot.copyWith(favoritePlates: plates, favoritePhones: phones);
    });

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    favoritesStream.drain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
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
      body: StreamBuilder<UserFavorites>(
          stream: favoritesStream,
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
                SingleChildScrollView(child: PlatesListingsGrid(itemList: snapshot.data?.favoritePlates ?? [])),
                SingleChildScrollView(child: PlatesListingsGrid(itemList: snapshot.data?.favoritePlates ?? [])),
              ],
            );
          }),
    );
  }
}
