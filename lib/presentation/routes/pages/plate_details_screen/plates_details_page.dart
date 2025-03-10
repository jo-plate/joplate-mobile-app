import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_listing_widget.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class PlatesDetailsPage extends StatefulWidget {
  const PlatesDetailsPage({super.key, required this.plateNumberListing});

  final Listing<PlateNumber> plateNumberListing;

  @override
  State<PlatesDetailsPage> createState() => _PlatesDetailsPageState();
}

class _PlatesDetailsPageState extends State<PlatesDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plate Details'),
        actions: [
          // Favorite Icon
          const FavoriteButton.plate(),
          // Share Icon
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              Share.share('Check out this plate number: ${widget.plateNumberListing.itemData.toString()}');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Plate Number Listing (Top)
            PlateNumberListingWidget(
              item: widget.plateNumberListing,
              isFeatured: true,
              aspectRatio: 2.1,
            ),

            const SizedBox(height: 10),

            // 2. Preview Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  const Text(
                    'Do you want to preview this plate on a vehicle?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement preview functionality
                      },
                      child: const Text(
                        'Preview Plates',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 3. Seller Info Card
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Seller',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.plateNumberListing.seller.displayName,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            launchUrlString("https://wa.me/${widget.plateNumberListing.seller.phonenumber}");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          icon: const FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Whatsapp',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Phone Call Button
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            launchUrlString("tel:${widget.plateNumberListing.seller.phonenumber}");
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          icon: const Icon(Icons.phone, color: Colors.white),
                          label: Text(
                            widget.plateNumberListing.seller.phonenumber,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 4. Important Notes
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
      ),
    );
  }
}
