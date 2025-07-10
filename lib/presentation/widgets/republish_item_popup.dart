import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/republish_item_dto.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

class RepublishItemDialog extends StatefulWidget {
  const RepublishItemDialog({
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
  State<RepublishItemDialog> createState() => _RepublishItemDialogState();
}

class _RepublishItemDialogState extends State<RepublishItemDialog> {
  bool submitting = false;
  FirebaseAnalytics analytics = injector();

  Future<void> _submit() async {
    setState(() => submitting = true);

    final dto = RepublishItemDto(
      id: widget.listingId,
      itemType: widget.itemType,
      listingType: widget.listingType,
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(republishItemCF);
      final res = await callable.call(dto.toJson());

      analytics.logEvent(
        name: 'listing_republished',
        parameters: {
          'listing_id': widget.listingId,
          'item_type': widget.itemType.name,
          'listing_type': widget.listingType.name,
          'item':
              widget.itemType == ItemType.phoneNumber ? widget.phoneNumber!.toString() : widget.plateNumber!.toString(),
        },
      );

      if (context.mounted) {
        Navigator.of(context).pop(); // close dialog
        final l10n = Localization.of(context);
        AppSnackbar.showSuccess(l10n.republish.success_message);
      }
    } on FirebaseFunctionsException catch (e) {
      AppSnackbar.showError(
        e.message ?? 'Republish failed',
      );
    } finally {
      if (mounted) setState(() => submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context);
    return AlertDialog(
      title: Text(l10n.republish.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.republish.description),
          const SizedBox(height: 12),
          Text(
            l10n.republish.extend_one_week,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
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
              : Text(l10n.republish.confirm, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
