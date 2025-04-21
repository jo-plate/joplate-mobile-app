import 'package:flutter/material.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';

class PromoteListingButton extends StatefulWidget {
  const PromoteListingButton(
      {super.key, required this.listingId, required this.itemType});
  final String listingId;
  final ItemType itemType;

  @override
  State<PromoteListingButton> createState() => _PromoteListingButtonState();
}

class _PromoteListingButtonState extends State<PromoteListingButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      label: const Text(
        'Promote Listing',
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(
        Icons.rocket_launch_outlined,
        color: Colors.white,
      ),
    );
  }
}
