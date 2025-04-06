import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_listing_screen/cubit/edit_phone_listing_cubit.dart';
// Suppose you have: EditPhoneListingState

@RoutePage()
class EditPhoneListingPage extends StatelessWidget {
  final String listingId;
  final String initialNumber;
  final double initialPrice;
  final double? initialDiscountPrice;
  final bool initialWithDiscount;
  final bool initialIsFeatured;

  const EditPhoneListingPage({
    super.key,
    required this.listingId,
    required this.initialNumber,
    required this.initialPrice,
    this.initialDiscountPrice,
    this.initialWithDiscount = false,
    this.initialIsFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditPhoneListingCubit>(
      create: (_) {
        final cubit = EditPhoneListingCubit();
        cubit.loadListingData(
          listingId: listingId,
          number: initialNumber,
          price: initialPrice,
          discountPrice: initialDiscountPrice,
          withDiscount: initialWithDiscount,
          isFeatured: initialIsFeatured,
        );
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Phone Listing"),
        ),
        body: SafeArea(
          child: BlocBuilder<EditPhoneListingCubit, EditPhoneListingState>(
            builder: (context, state) {
              final cubit = context.read<EditPhoneListingCubit>();

              return SingleChildScrollView(
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
                    TextField(
                      decoration: const InputDecoration(labelText: 'Phone Number'),
                      onChanged: cubit.updateNumber,
                      enabled: !state.isSubmitting,
                      controller: TextEditingController(text: state.number),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Price'),
                      onChanged: cubit.updatePrice,
                      enabled: !state.isSubmitting,
                      controller: TextEditingController(text: state.price),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("With Discount?"),
                        Switch(
                          value: state.withDiscount,
                          onChanged: state.isSubmitting ? null : cubit.toggleDiscount,
                        ),
                      ],
                    ),
                    if (state.withDiscount)
                      TextField(
                        decoration: const InputDecoration(labelText: 'Discount Price'),
                        onChanged: cubit.updateDiscountPrice,
                        enabled: !state.isSubmitting,
                        controller: TextEditingController(text: state.discountPrice ?? ''),
                      ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Featured?"),
                        Switch(
                          value: state.isFeatured,
                          onChanged: state.isSubmitting ? null : cubit.toggleFeatured,
                        ),
                      ],
                    ),
                    if (state.isSubmitting) const Center(child: CircularProgressIndicator()),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: state.isSubmitting
                          ? null
                          : () async {
                              await cubit.submitEdit();
                              if (cubit.state.errorMessage == null && !cubit.state.isSubmitting) {
                                // e.g. close or navigate away
                                AutoRouter.of(context).maybePop();
                              }
                            },
                      child: const Text("Save Changes"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
