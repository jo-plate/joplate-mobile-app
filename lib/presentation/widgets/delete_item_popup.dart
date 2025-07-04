import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/delete_item_dto.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

class DeleteListingDialog extends StatefulWidget {
  const DeleteListingDialog({
    super.key,
    required this.listingId,
    required this.itemType,
    required this.listingType,
    this.phoneNumber,
    this.plateNumber,
  });

  final String listingId;
  final ItemType itemType;
  final ListingType listingType;
  final PhoneNumber? phoneNumber;
  final PlateNumber? plateNumber;

  @override
  State<DeleteListingDialog> createState() => _DeleteListingDialogState();
}

class _DeleteListingDialogState extends State<DeleteListingDialog> {
  bool markAsSold = false;
  bool submitting = false;
  FirebaseAnalytics analytics = injector();

  Future<void> _submit() async {
    setState(() => submitting = true);

    final dto = DeleteItemDto(
      id: widget.listingId,
      itemType: widget.itemType,
      listingType: widget.listingType,
      isSold: markAsSold,
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(deleteItemCF);
      final res = await callable.call(dto.toJson());
      if (markAsSold) {
        analytics.logEvent(
          name: 'listing_sold',
          parameters: {
            'listing_id': widget.listingId,
            'item_type': widget.itemType.name,
            'listing_type': widget.listingType.name,
            'item': widget.itemType == ItemType.phoneNumber
                ? widget.phoneNumber!.toString()
                : widget.plateNumber!.toString(),
          },
        );
      } else {
        analytics.logEvent(
          name: 'listing_deleted',
          parameters: {
            'listing_id': widget.listingId,
            'item_type': widget.itemType.name,
            'listing_type': widget.listingType.name,
            'item': widget.itemType == ItemType.phoneNumber
                ? widget.phoneNumber!.toString()
                : widget.plateNumber!.toString(),
          },
        );
      }
      if (context.mounted) {
        Navigator.of(context).pop(); // close dialog
        final l10n = Localization.of(context);
        AppSnackbar.showSuccess(l10n.deletelisting.success_message);
      }
    } on FirebaseFunctionsException catch (e) {
      AppSnackbar.showError(
        e.message ?? 'Delete failed',
      );
    } finally {
      if (mounted) setState(() => submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context);
    return AlertDialog(
      title: Text(l10n.deletelisting.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.deletelisting.description),
          const SizedBox(height: 12),
          CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            value: markAsSold,
            onChanged: (val) => setState(() => markAsSold = val ?? false),
            title: Text(l10n.deletelisting.mark_as_sold),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: submitting ? null : () => Navigator.of(context).pop(),
          child: Text(l10n.common.cancel),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
          onPressed: submitting ? null : _submit,
          child: submitting
              ? const CircularProgressIndicator()
              : Text(l10n.deletelisting.delete, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
