import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_dialer/flutter_phone_dialer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_listing_widget.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class PlatesDetailsPage extends StatefulWidget {
  const PlatesDetailsPage({super.key, @PathParam('plateNumber') required this.plateNumber});

  final String plateNumber;

  @override
  State<PlatesDetailsPage> createState() => _PlatesDetailsPageState();
}

class _PlatesDetailsPageState extends State<PlatesDetailsPage> {
  late final Stream<PlateNumber> _plateStream;

  @override
  void initState() {
    super.initState();
    _plateStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .doc(widget.plateNumber.toString())
        .snapshots()
        .map((snapshot) => PlateNumber.fromJson(snapshot.data()!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plate Details'),
        actions: [
          FavoriteButton.plate(listingId: widget.plateNumber.toString()),
          // IconButton(
          //   icon: const Icon(Icons.share_outlined),
          //   onPressed: () {
          //     Share.share('Check out this plate number: ${widget.plateNumber.toString()}');
          //   },
          // ),
        ],
      ),
      body: StreamBuilder<PlateNumber>(
          stream: _plateStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Padding(
                padding: EdgeInsets.only(left: 24.0, right: 24, top: MediaQuery.of(context).size.height / 4),
                child: Text(
                  'Error getteing data for Plate Number: ${widget.plateNumber}',
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

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 180,
                    child: PlateNumberListingWidget(
                      item: snapshot.data!,
                      hideLikeButton: true,
                      priceLabelFontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SellerDetails(userId: snapshot.data!.originalListing.id),
                  const SizedBox(height: 20),
                  Container(
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
                    child: const OtherSellersTable(),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Important Note:',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.payments, color: Color(0xFF981C1E)),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Don't transfer money online",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF981C1E)),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Meet the seller in person",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          }),
    );
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
                    const Text(
                      'Originally posted by',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                          const SizedBox(height: 4),
                          Text(
                            'Member since ${DateTime.now().year - 2020}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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

class OtherSellersTable extends StatelessWidget {
  const OtherSellersTable({super.key});

  @override
  Widget build(BuildContext context) {
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
                Icons.people_outline,
                color: Color(0xFF981C1E),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Other Sellers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
          },
          children: [
            const TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE0E0E0),
                    width: 1,
                  ),
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Seller',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7F8C8D),
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Price',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7F8C8D),
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7F8C8D),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            _buildSellerRow(
              name: 'Ahmed Hassan',
              daysAgo: '2 days ago',
              price: '15,000',
              phoneNumber: '+962787940864',
              isFeatured: true,
            ),
            _buildSellerRow(
              name: 'Mohammed Ali',
              daysAgo: '5 days ago',
              price: 'Call for Price',
              phoneNumber: '+962787940865',
              isFeatured: false,
            ),
            _buildSellerRow(
              name: 'Sarah Johnson',
              daysAgo: '1 week ago',
              price: '18,500',
              phoneNumber: '+962787940866',
              isFeatured: true,
            ),
          ],
        ),
      ],
    );
  }

  TableRow _buildSellerRow({
    required String name,
    required String daysAgo,
    required String price,
    required String phoneNumber,
    required bool isFeatured,
  }) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFF5F5F5),
            width: 1,
          ),
        ),
      ),
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      size: 18,
                      color: Color(0xFF981C1E),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          daysAgo,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],),              
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            price,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
              fontFamily: 'Mandatory',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const FaIcon(
                    FontAwesomeIcons.whatsapp,
                    size: 14,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    launchUrlString(
                      "https://wa.me/$phoneNumber",
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFF981C1E).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.phone,
                    size: 14,
                    color: Color(0xFF981C1E),
                  ),
                  onPressed: () {
                    FlutterPhoneDialer.dialNumber(phoneNumber);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
