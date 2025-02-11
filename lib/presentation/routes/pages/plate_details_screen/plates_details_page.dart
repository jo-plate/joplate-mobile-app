import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_listing_widget.dart';

@RoutePage()
class PlatesDetailsPage extends StatefulWidget {
  const PlatesDetailsPage({super.key, required this.plateNumber});
// add autorouter annotation plate is a string in the format of {int}-{int} '/plate-details/:plateNumber
  

  
  final PlateNumber plateNumber;

  @override
  State<PlatesDetailsPage> createState() => _PlatesDetailsPageState();
}

class _PlatesDetailsPageState extends State<PlatesDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plate Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlateNumberListingWidget(
                item:
                    Listing(data: widget.plateNumber, itemType: ItemType.plateNumber, listingType: ListingType.request))
          ],
        ),
      ),
    );
  }
}
