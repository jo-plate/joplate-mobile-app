import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/listing_status.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_listing_grid.dart';
import 'package:joplate/presentation/widgets/listing_status_filter.dart';

class PhoneListingsByUserId extends StatefulWidget {
  const PhoneListingsByUserId({super.key, required this.userId});

  final String userId;

  @override
  State<PhoneListingsByUserId> createState() => _PhoneListingsByUserIdState();
}

class _PhoneListingsByUserIdState extends State<PhoneListingsByUserId> {
  final Set<ListingStatus> _selectedFilters = {};

  @override
  void initState() {
    super.initState();
    userPhonesStream = FirebaseFirestore.instance
        .collection(phoneNumbersCollectionId)
        .where('userId', isEqualTo: widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PhoneListing.fromSnapshot(doc)).toList());
  }

  late final Stream<List<PhoneListing>> userPhonesStream;

  void _handleFilterChanged(ListingStatus status) {
    setState(() {
      if (_selectedFilters.contains(status)) {
        _selectedFilters.remove(status);
      } else {
        _selectedFilters.add(status);
      }
    });
  }

  List<PhoneListing> _filterListings(List<PhoneListing> listings) {
    if (_selectedFilters.isEmpty) return listings;

    return listings.where((listing) {
      if (_selectedFilters.contains(ListingStatus.featured) && listing.isFeatured) {
        return true;
      }
      if (_selectedFilters.contains(ListingStatus.active) && listing.isActive) {
        return true;
      }
      if (_selectedFilters.contains(ListingStatus.inactive) && !listing.isActive) {
        return true;
      }
      if (_selectedFilters.contains(ListingStatus.disabled) && listing.isDisabled) {
        return true;
      }
      if (_selectedFilters.contains(ListingStatus.expired) && listing.isExpired) {
        return true;
      }
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListingStatusFilter(
            selectedFilters: _selectedFilters,
            onFilterChanged: _handleFilterChanged,
          ),
        ),
        Expanded(
          child: StreamBuilder<List<PhoneListing>>(
            stream: userPhonesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
        
              final listings = snapshot.data ?? [];
              final filteredListings = _filterListings(listings);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PhonesListingGrid(
                  itemList: filteredListings,
                  shrinkWrap: false,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
