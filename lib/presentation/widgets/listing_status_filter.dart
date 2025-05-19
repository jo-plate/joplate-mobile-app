import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/listing_status.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

class ListingStatusFilter extends StatelessWidget {
  const ListingStatusFilter({
    super.key,
    required this.selectedFilters,
    required this.onFilterChanged,
  });

  final Set<ListingStatus> selectedFilters;
  final Function(ListingStatus) onFilterChanged;

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: ListingStatus.values.map((status) {
            final isSelected = selectedFilters.contains(status);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FilterChip(
                label: Text(
                  _getStatusLabel(status, m),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
                selected: isSelected,
                onSelected: (_) => onFilterChanged(status),
                backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[200],
                selectedColor: const Color(0xFF8B0000), // Maroon color
                checkmarkColor: Colors.white,
                labelStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                avatar: Icon(
                  isSelected ? Icons.remove : Icons.add,
                  size: 18,
                  color: isSelected ? Colors.white : Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  String _getStatusLabel(ListingStatus status, dynamic m) {
    switch (status) {
      case ListingStatus.featured:
        return m.common.listing_status.featured;
      case ListingStatus.active:
        return m.common.listing_status.active;
      case ListingStatus.inactive:
        return m.common.listing_status.inactive;
      case ListingStatus.disabled:
        return m.common.listing_status.disabled;
      case ListingStatus.expired:
        return m.common.listing_status.expired;
      case ListingStatus.sold:
        return m.common.listing_status.sold;
    }
  }
}
