import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // if you’re using it for snackBars
import 'package:joplate/data/constants.dart'; // deleteItemCF constant
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/delete_item_dto.dart';

class DeleteListingDialog extends StatefulWidget {
  const DeleteListingDialog({
    super.key,
    required this.listingId,
    required this.itemType,
    required this.listingType,
  });

  final String listingId;
  final ItemType itemType;
  final ListingType listingType;

  @override
  State<DeleteListingDialog> createState() => _DeleteListingDialogState();
}

class _DeleteListingDialogState extends State<DeleteListingDialog> {
  bool markAsSold = false;
  bool submitting = false;

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

      if (context.mounted) {
        Navigator.of(context).pop(); // close dialog
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Listing deleted successfully')),
        );
      }
    } on FirebaseFunctionsException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Delete failed')),
        );
      }
    } finally {
      if (mounted) setState(() => submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete listing?'),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('This action is irreversible. Do you really want to delete this listing?'),
          const SizedBox(height: 12),
          CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            value: markAsSold,
            onChanged: (val) => setState(() => markAsSold = val ?? false),
            title: const Text('Mark as sold'),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
      actions: [
        Expanded(
          child: TextButton(
            onPressed: submitting ? null : () => Navigator.of(context).pop(),
            child: const Text('CANCEL'),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            onPressed: submitting ? null : _submit,
            child: submitting
                ? const CircularProgressIndicator()
                : const Text('DELETE', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
