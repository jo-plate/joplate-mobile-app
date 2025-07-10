import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/republish_item_dto.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

class RepublishListingButton extends StatefulWidget {
  final PlateListing? plateListing;
  final PhoneListing? phoneListing;

  const RepublishListingButton.plate({
    super.key,
    required this.plateListing,
  }) : phoneListing = null;

  const RepublishListingButton.phone({
    super.key,
    required this.phoneListing,
  }) : plateListing = null;

  @override
  State<RepublishListingButton> createState() => _RepublishListingButtonState();
}

class _RepublishListingButtonState extends State<RepublishListingButton> {
  bool isLoading = false;

  Future<void> _republishListing() async {
    final m = Localization.of(context);

    setState(() {
      isLoading = true;
    });

    try {
      RepublishItemDto dto;

      if (widget.plateListing != null) {
        // Republish plate listing
        final plate = widget.plateListing!;
        dto = RepublishItemDto(
          id: plate.id,
          itemType: ItemType.plateNumber,
          listingType: ListingType.ad,
        );
      } else {
        // Republish phone listing
        final phone = widget.phoneListing!;
        dto = RepublishItemDto(
          id: phone.id,
          itemType: ItemType.phoneNumber,
          listingType: ListingType.ad,
        );
      }

      final callable = FirebaseFunctions.instance.httpsCallable(republishItemCF);
      final response = await callable.call(dto.toJson());

      if (response.data != null && response.data['success'] == true) {
        // Show success message
        AppSnackbar.showSuccess(m.common.republish_success);
      } else {
        AppSnackbar.showError(m.common.republish_failed);
      }
    } on FirebaseFunctionsException catch (e) {
      AppSnackbar.showError(e.message ?? m.common.republish_failed);
    } catch (e) {
      AppSnackbar.showError(m.common.republish_failed);
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: isLoading ? null : _republishListing,
      icon: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Icon(Icons.refresh, size: 20),
      label: Text(
        m.common.republish,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
