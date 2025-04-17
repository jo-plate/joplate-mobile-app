import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/user_favorites.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/anon_user_view.dart';
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
  late Stream<UserFavorites> favoritesStream;
  late final Stream<User?> userStream;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    userStream = FirebaseAuth.instance.userChanges();
    setFavoritesStream();
    tabController = TabController(length: 2, vsync: this);
  }

  void setFavoritesStream() {
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
      final List<PhoneListing> phones = await Future.wait(
        snapshot.favoritePhones.map((id) async {
          final phone = await FirebaseFirestore.instance.collection(phoneNumbersCollectionId).doc(id.id).get();
          final phoneDict = phone.data()!;
          phoneDict['id'] = id;
          return PhoneListing.fromJson({...phoneDict, 'id': id});
        }),
      );
      return snapshot.copyWith(favoritePlates: plates, favoritePhones: phones);
    });
  }

  @override
  void dispose() {
    super.dispose();
    favoritesStream.drain();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return StreamBuilder<User?>(
        stream: userStream,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(m.footer.favorites),
                  centerTitle: true,
                ),
                body: const AnonUserView());
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(m.footer.favorites),
              centerTitle: true,
              bottom: TabBar(
                controller: tabController,
                tabs: [
                  Tab(text: m.home.car_number),
                  Tab(text: m.home.phone_numbers),
                ],
              ),
            ),
            body: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(favoritesCollectionId)
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError || !snapshot.hasData || snapshot.data?.data() == null) {
                  return Center(child: Text(m.favoritesSc.no_favorites));
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
                      return Center(child: Text(m.favoritesSc.failed_to_load));
                    }

                    return FutureBuilder<List<PhoneListing>>(
                      future: fetchPhones(userFavorites.favoritePhones),
                      builder: (context, phoneSnapshot) {
                        if (phoneSnapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (phoneSnapshot.hasError || phoneSnapshot.data == null) {
                          return Center(child: Text(m.favoritesSc.failed_to_load));
                        }

                        return TabBarView(
                          controller: tabController,
                          children: [
                            SingleChildScrollView(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: PlatesListingsGrid(itemList: plateSnapshot.data ?? []),
                            )),
                            SingleChildScrollView(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: PhonesListingGrid(itemList: phoneSnapshot.data ?? []),
                            )),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          );
        });
  }
}
