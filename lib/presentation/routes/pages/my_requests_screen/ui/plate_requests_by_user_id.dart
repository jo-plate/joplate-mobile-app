import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/listing_status.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_request_grid.dart';
import 'package:joplate/presentation/widgets/listing_status_filter.dart';

class PlateRequestsByUserId extends StatefulWidget {
  const PlateRequestsByUserId({super.key, required this.userId});

  final String userId;

  @override
  State<PlateRequestsByUserId> createState() => _PlateRequestsByUserIdState();
}

class _PlateRequestsByUserIdState extends State<PlateRequestsByUserId> {
  final Set<ListingStatus> _selectedFilters = {};

  @override
  void initState() {
    super.initState();
    userPlatesStream = FirebaseFirestore.instance
        .collection(platesRequestsCollectionId)
        .where('userId', isEqualTo: widget.userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return PlateRequest.fromSnapshot(doc);
            }).toList());
  }

  late final Stream<List<PlateRequest>> userPlatesStream;

  void _handleFilterChanged(ListingStatus status) {
    setState(() {
      if (_selectedFilters.contains(status)) {
        _selectedFilters.remove(status);
      } else {
        _selectedFilters.add(status);
      }
    });
  }

  List<PlateRequest> _filterListings(List<PlateRequest> requests) {
    if (_selectedFilters.isEmpty) return requests;

    return requests.where((request) {
      if (_selectedFilters.contains(ListingStatus.active) && !request.isDisabled && !request.isExpired) {
        return true;
      }
      if (_selectedFilters.contains(ListingStatus.inactive) && !request.isDisabled && request.isExpired) {
        return true;
      }
      if (_selectedFilters.contains(ListingStatus.disabled) && request.isDisabled) {
        return true;
      }
      if (_selectedFilters.contains(ListingStatus.expired) && request.isExpired) {
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
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListingStatusFilter(
            selectedFilters: _selectedFilters,
            onFilterChanged: _handleFilterChanged,
            enabledFilters: const [
              ListingStatus.active,
              ListingStatus.inactive,
              ListingStatus.disabled,
              ListingStatus.expired,
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder<List<PlateRequest>>(
            stream: userPlatesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final requests = snapshot.data ?? [];
              final filteredRequests = _filterListings(requests);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PlatesRequestGrid(
                  itemList: filteredRequests,
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
