import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_dialer/flutter_phone_dialer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_listing_widget.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/promote_listing_button.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class PlatesDetailsPage extends StatefulWidget {
  const PlatesDetailsPage({super.key, @PathParam('listingId') required this.listingId});

  final String listingId;

  @override
  State<PlatesDetailsPage> createState() => _PlatesDetailsPageState();
}

class _PlatesDetailsPageState extends State<PlatesDetailsPage> {
  late final Stream<PlateListing> _plateStream;

  @override
  void initState() {
    super.initState();
    _plateStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .doc(widget.listingId)
        .snapshots()
        .map((snapshot) => PlateListing.fromSnapshot(snapshot));
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return StreamBuilder<PlateListing>(
        stream: _plateStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24, top: MediaQuery.of(context).size.height / 4),
              child: Text(
                'Error getting data for Listing',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
              appBar: AppBar(
                title: Text(m.platesdetails.title),
                actions: [
                  FavoriteButton.plate(listingId: widget.listingId),
                  const SizedBox(
                    width: 16,
                  ),
                  if (FirebaseAuth.instance.currentUser?.uid == snapshot.data!.userId) ...[
                    GestureDetector(
                      child: const Icon(Icons.edit_outlined),
                      onTap: () {
                        AutoRouter.of(context).push(EditPlateListingRoute(listing: snapshot.data!));
                      },
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      child: const Icon(Icons.delete_outline),
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ]
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 170,
                      child: PlateNumberListingWidget(
                        disabled: true,
                        item: snapshot.data!,
                        hideLikeButton: true,
                        priceLabelFontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (!(snapshot.data?.isFeatured ?? false))
                      PromoteListingButton(listingId: snapshot.data!.id, itemType: ItemType.plateNumber),
                    const SizedBox(height: 16),
                    SellerDetails(userId: snapshot.data!.userId),
                    const SizedBox(height: 16),
                    OtherSellersTable(
                      userId: snapshot.data!.userId,
                      plateNumber: snapshot.data!.item,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            m.platesdetails.important_note,
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.payments, color: Color(0xFF981C1E)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  m.platesdetails.dont_transfer_money,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Color(0xFF981C1E)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  m.platesdetails.meet_in_person,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ));
        });
  }
}

class SellerDetails extends StatefulWidget {
  const SellerDetails({super.key, required this.userId});
  final String userId;

  @override
  State<SellerDetails> createState() => _SellerDetailsState();
}

class _SellerDetailsState extends State<SellerDetails> {
  late final Stream<UserProfile> userProfileStream;

  @override
  void initState() {
    super.initState();
    userProfileStream =
        FirebaseFirestore.instance.collection(userProfileCollectionId).doc(widget.userId).snapshots().map((snapshot) {
      return UserProfile.fromJson(snapshot.data() ?? {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: StreamBuilder<UserProfile>(
          stream: userProfileStream,
          builder: (context, snapshot) {
            final userProfile = snapshot.data;
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (userProfile == null) {
              return const Text('User not found');
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF981C1E).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: Color(0xFF981C1E),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      m.platesdetails.originally_posted_by,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 24,
                        color: Color(0xFF981C1E),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userProfile.displayName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {
                            launchUrlString("https://wa.me/${userProfile.phonenumber}",
                                mode: LaunchMode.externalApplication);
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.green,
                                size: 16,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'WhatsApp',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF981C1E).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {
                            FlutterPhoneDialer.dialNumber(userProfile.phonenumber);
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.phone,
                                color: Color(0xFF981C1E),
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                userProfile.phonenumber,
                                style: const TextStyle(
                                  color: Color(0xFF981C1E),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}

class OtherSellersTable extends StatefulWidget {
  final String userId;
  final PlateNumber plateNumber;

  const OtherSellersTable({
    super.key,
    required this.userId,
    required this.plateNumber,
  });

  @override
  State<OtherSellersTable> createState() => _OtherSellersTableState();
}

class _OtherSellersTableState extends State<OtherSellersTable> {
  Future<List<Map<String, dynamic>>> _fetchOtherSellers() async {
    final listingsSnapshot = await FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('item.code', isEqualTo: widget.plateNumber.code)
        .where('item.number', isEqualTo: widget.plateNumber.number)
        .where('userId', isNotEqualTo: widget.userId)
        .get();

    final otherListings = listingsSnapshot.docs.map((doc) {
      return PlateListing.fromSnapshot(doc);
    }).toList();

    final userIds = otherListings.map((l) => l.userId).toSet().toList();

    final userDocs = await Future.wait(
      userIds.map((id) => FirebaseFirestore.instance.collection(userProfileCollectionId).doc(id).get()),
    );

    final profiles = userDocs.where((doc) => doc.exists).map((doc) => UserProfile.fromSnapshot(doc)).toList();

    return List.generate(otherListings.length, (i) {
      final profile = profiles[i];
      final listing = otherListings[i];

      return {
        "name": profile.displayName,
        "phone": profile.phonenumber,
        "price": listing.priceHidden ? 'Call for Price' : listing.price.toString(),
        "isFeatured": listing.isFeatured,
        "listingId": listing.id,
        "createdAt": listing.createdAt,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchOtherSellers(),
      builder: (context, snapshot) {
        // print(snapshot.data);
        if (snapshot.data == null || (snapshot.data?.isEmpty ?? true)) {
          return const SizedBox();
        }

        final sellers = snapshot.data!;

        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF981C1E).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.people_outline, color: Color(0xFF981C1E), size: 20),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    m.platesdetails.other_sellers,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                children: [
                  _buildTableHeader(context),
                  ...sellers.map((s) => _buildSellerRow(
                        name: s['name'],
                        price: s['price'],
                        phoneNumber: s['phone'],
                        isFeatured: s['isFeatured'],
                        listingId: s['listingId'],
                      )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  TableRow _buildTableHeader(BuildContext context) {
    final m = Localization.of(context);
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
      ),
      children: [
        _headerText(m.platesdetails.seller),
        _headerText(m.platesdetails.price),
        _headerText(m.platesdetails.contact),
      ],
    );
  }

  Widget _headerText(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF7F8C8D),
            fontSize: 13,
          ),
        ),
      );

  TableRow _buildSellerRow({
    required String name,
    required String price,
    required String phoneNumber,
    required bool isFeatured,
    required String listingId,
}) {
    void _goToDetails() => AutoRouter.of(context).push(PlatesDetailsRoute(listingId: listingId));

    Widget wrap(Widget child) => Material(
          color: Colors.transparent, // so InkWell splash works
          child: InkWell(
            onTap: _goToDetails,
            child: child,
          ),
        );

    return TableRow(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF5F5F5), width: 1)),
      ),
      children: [
        // seller / avatar cell
        wrap(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
                const CircleAvatar(radius: 16, child: Icon(Icons.person_outline, size: 18)),
                const SizedBox(width: 12),
                Text(name,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),

        // price cell
        wrap(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(price, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
          ),
        ),

        // contact cell (keep the icons clickable too)
        wrap(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _iconButton(
                color: Colors.green,
                icon: FontAwesomeIcons.whatsapp,
                onPressed: () => launchUrlString("https://wa.me/$phoneNumber"),
              ),
              const SizedBox(width: 8),
              _iconButton(
                color: const Color(0xFF981C1E),
                icon: Icons.phone,
                onPressed: () => FlutterPhoneDialer.dialNumber(phoneNumber),
              ),
            ],
          ),
        ),
        ),
      ],
    );
  }

  Widget _iconButton({required Color color, required IconData icon, required VoidCallback onPressed}) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 14, color: color),
        onPressed: onPressed,
      ),
    );
  }
}
