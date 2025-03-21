import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/user_favorites.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_listing_grid.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_listing_grid.dart';
import 'package:joplate/presentation/utils/firebase_utils.dart';

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
      return UserFavorites.fromJson(snapshot.data() ?? {});
    }).asyncMap((snapshot) async {
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
          tabs: const [
            Tab(text: 'Car Numbers'),
            Tab(text: 'Phone Numbers'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection(favoritesCollectionId)
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
        
            if (snapshot.hasError || !snapshot.hasData || snapshot.data?.data() == null) {
              return const Center(child: Text('No favorites found'));
            }

            // Convert snapshot to UserFavorites
            final userFavorites = UserFavorites.fromJson(snapshot.data!.data() as Map<String, dynamic>);

            return FutureBuilder<List<PlateNumber>>(
              future: fetchPlates(userFavorites.favoritePlatesIds),
              builder: (context, plateSnapshot) {
                if (plateSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (plateSnapshot.hasError || plateSnapshot.data == null) {
                  return const Center(child: Text('Failed to load plates.'));
                }

                return FutureBuilder<List<PhoneNumber>>(
                  future: fetchPhones(userFavorites.favoritePhones),
                  builder: (context, phoneSnapshot) {
                    if (phoneSnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (phoneSnapshot.hasError || phoneSnapshot.data == null) {
                      return const Center(child: Text('Failed to load phone numbers.'));
                    }

                    return TabBarView(
                      controller: tabController,
                      children: [
                        SingleChildScrollView(child: PlatesListingsGrid(itemList: plateSnapshot.data ?? [])),
                        SingleChildScrollView(child: PhonesListingGrid(itemList: PhoneNumber.mockList(10) ?? [])),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

}
