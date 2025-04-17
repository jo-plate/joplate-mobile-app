import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_listing_screen/cubit/edit_phone_listing_cubit.dart';

@RoutePage()
class EditPhoneListingPage extends StatelessWidget {
  final PhoneListing listing;

  const EditPhoneListingPage({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditPhoneListingCubit>(
      create: (_) {
        final cubit = EditPhoneListingCubit();
        cubit.loadListing(listing);
        return cubit;
      },
      child: const _EditPhoneListingContent(),
    );
  }
}

class _EditPhoneListingContent extends StatelessWidget {
  const _EditPhoneListingContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPhoneListingCubit, EditPhoneListingState>(
      builder: (context, state) {
        final cubit = context.read<EditPhoneListingCubit>();

        return Scaffold(
          appBar: AppBar(title: const Text("Edit Phone Listing")),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.errorMessage != null)
                    Text(state.errorMessage!,
                        style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: TextEditingController(text: state.number),
                    enabled: false,
                    decoration:
                        const InputDecoration(labelText: "Phone Number"),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: TextEditingController(text: state.price),
                    keyboardType: TextInputType.number,
                    onChanged: cubit.updatePrice,
                    enabled: !state.isSubmitting,
                    decoration: const InputDecoration(labelText: "Price"),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("With Discount?"),
                      Switch(
                        value: state.discountPrice != null,
                        onChanged:
                            state.isSubmitting ? null : cubit.toggleDiscount,
                      ),
                    ],
                  ),
                  if (state.discountPrice != null)
                    TextField(
                      controller: TextEditingController(
                          text: state.discountPrice ?? ''),
                      keyboardType: TextInputType.number,
                      onChanged: cubit.updateDiscountPrice,
                      enabled: !state.isSubmitting,
                      decoration:
                          const InputDecoration(labelText: "Discount Price"),
                    ),
                  const SizedBox(height: 16),
                  _buildSwitchRow("Feature this listing", state.isFeatured,
                      cubit.toggleFeatured, state.isSubmitting),
                  _buildSwitchRow("Mark as Sold", state.isSold,
                      cubit.toggleSold, state.isSubmitting),
                  _buildSwitchRow("Disable this listing", state.isDisabled,
                      cubit.toggleDisabled, state.isSubmitting),
                  const SizedBox(height: 24),
                  if (state.isSubmitting)
                    const Center(child: CircularProgressIndicator())
                  else
                    ElevatedButton(
                      onPressed: () async {
                        await cubit.submitEdit();
                        if (cubit.state.errorMessage == null &&
                            !cubit.state.isSubmitting) {
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

  Widget _buildSwitchRow(
    String label,
    bool value,
    void Function(bool) onChanged,
    bool disabled,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(value: value, onChanged: disabled ? null : onChanged),
      ],
    );
  }
}
