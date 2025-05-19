import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/listing_status.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_listing_grid.dart';
import 'package:joplate/presentation/widgets/listing_status_filter.dart';

class PlateListingsByUserId extends StatefulWidget {
  const PlateListingsByUserId({super.key, required this.userId});

  final String userId;

  @override
  State<PlateListingsByUserId> createState() => _PlateListingsByUserIdState();
}

class _PlateListingsByUserIdState extends State<PlateListingsByUserId> {
  final Set<ListingStatus> _selectedFilters = {};

  @override
  void initState() {
    super.initState();
    userPlatesStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('userId', isEqualTo: widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PlateListing.fromSnapshot(doc)).toList());
  }

  late final Stream<List<PlateListing>> userPlatesStream;

  void _handleFilterChanged(ListingStatus status) {
    setState(() {
      if (_selectedFilters.contains(status)) {
        _selectedFilters.remove(status);
      } else {
        _selectedFilters.add(status);
      }
    });
  }

  List<PlateListing> _filterListings(List<PlateListing> listings) {
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
      if (_selectedFilters.contains(ListingStatus.sold) && listing.isSold) {
        return true;
      }
      if (_selectedFilters.isEmpty) return true;
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListingStatusFilter(
            selectedFilters: _selectedFilters,
            onFilterChanged: _handleFilterChanged,
          ),
        ),
        Expanded(
          child: StreamBuilder<List<PlateListing>>(
            stream: userPlatesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
        
              final listings = snapshot.data ?? [];
              final filteredListings = _filterListings(listings);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PlatesListingsGrid(
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
