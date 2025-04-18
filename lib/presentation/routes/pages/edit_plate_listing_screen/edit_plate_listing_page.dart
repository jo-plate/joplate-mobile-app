import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_listing_screen/cubit/edit_plate_listing_cubit.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_listing_screen/cubit/edit_plate_listing_state.dart';

@RoutePage()
class EditPlateListingPage extends StatelessWidget {
  final PlateListing listing;

  const EditPlateListingPage({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditPlateListingCubit>(
      create: (_) => EditPlateListingCubit()
        ..loadListingData(
          listingId: listing.id,
          code: listing.item.code,
          plateNumber: listing.item.number,
          price: listing.price,
          discountPrice: listing.discountPrice,
          isFeatured: listing.isFeatured,
          isDisabled: listing.isDisabled,
          isSold: listing.isSold,
        ),
      child: const _EditPlateListingView(),
    );
  }
}

class _EditPlateListingView extends StatelessWidget {
  const _EditPlateListingView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPlateListingCubit, EditPlateListingState>(
      builder: (context, state) {
        final cubit = context.read<EditPlateListingCubit>();

        return Scaffold(
          appBar: AppBar(title: const Text("Edit Plate Listing")),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.errorMessage != null)
                    Text(
                      state.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 8),
                  _inputField("Code", state.code, cubit.updateCode,
                      enabled: !state.isSubmitting),
                  const SizedBox(height: 16),
                  _inputField("Plate Number", state.plateNumber,
                      cubit.updatePlateNumber,
                      enabled: !state.isSubmitting),
                  const SizedBox(height: 16),
                  _inputField("Price", state.price, cubit.updatePrice,
                      enabled: !state.isSubmitting),
                  const SizedBox(height: 16),
                  _inputField("Discount Price", state.discountPrice ?? '',
                      cubit.updateDiscountPrice,
                      enabled: !state.isSubmitting),
                  const SizedBox(height: 16),
                  _toggleRow("Featured", state.isFeatured, cubit.toggleFeatured,
                      disabled: state.isSubmitting),
                  _toggleRow("Disabled", state.isDisabled, cubit.toggleDisabled,
                      disabled: state.isSubmitting),
                  _toggleRow("Sold", state.isSold, cubit.toggleSold,
                      disabled: state.isSubmitting),
                  const SizedBox(height: 24),
                  if (state.isSubmitting)
                    const Center(child: CircularProgressIndicator())
                  else
                    ElevatedButton(
                      onPressed: () async {
                        await cubit.submitEdit();
                        final updatedState = cubit.state;
                        if (context.mounted &&
                            updatedState.errorMessage == null &&
                            !updatedState.isSubmitting) {
                          AutoRouter.of(context).maybePop();
                        }
                      },
                      child: const Text("Save Changes",
                          style: TextStyle(color: Colors.white)),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _inputField(String label, String value, ValueChanged<String> onChanged,
      {bool enabled = true}) {
    final controller = TextEditingController(text: value);
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
    );
  }

  Widget _toggleRow(String label, bool value, ValueChanged<bool> onChanged,
      {bool disabled = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(value: value, onChanged: disabled ? null : onChanged),
      ],
    );
  }
}
