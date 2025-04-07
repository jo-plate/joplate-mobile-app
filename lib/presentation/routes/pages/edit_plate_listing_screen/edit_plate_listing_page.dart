import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_listing_screen/cubit/edit_plate_listing_cubit.dart';

@RoutePage()
class EditPlateListingPage extends StatelessWidget {
  final String listingId;
  final String initialCode;
  final String initialNumber;
  final double initialPrice;
  final double? initialDiscountPrice;
  final bool initialWithDiscount;
  final bool initialIsFeatured;

  const EditPlateListingPage({
    super.key,
    required this.listingId,
    required this.initialCode,
    required this.initialNumber,
    required this.initialPrice,
    this.initialDiscountPrice,
    this.initialWithDiscount = false,
    this.initialIsFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditPlateListingCubit>(
      create: (_) {
        final cubit = EditPlateListingCubit();
        cubit.loadListingData(
          listingId: listingId,
          code: initialCode,
          plateNumber: initialNumber,
          price: initialPrice,
          discountPrice: initialDiscountPrice,
          withDiscount: initialWithDiscount,
          isFeatured: initialIsFeatured,
        );
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Plate Listing"),
        ),
        body: SafeArea(
          child: BlocBuilder<EditPlateListingCubit, EditPlateListingState>(
            builder: (context, state) {
              final cubit = context.read<EditPlateListingCubit>();

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
                      decoration: const InputDecoration(labelText: 'Code'),
                      onChanged: cubit.updateCode,
                      enabled: !state.isSubmitting,
                      controller: TextEditingController(text: state.code),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Plate Number'),
                      onChanged: cubit.updatePlateNumber,
                      enabled: !state.isSubmitting,
                      controller: TextEditingController(text: state.plateNumber),
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
