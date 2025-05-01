import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_listing_screen/cubit/edit_plate_listing_cubit.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_listing_screen/cubit/edit_plate_listing_state.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/promote_listing_button.dart';

@RoutePage()
class EditPlateListingPage extends StatefulWidget {
  final PlateListing listing;
  const EditPlateListingPage({super.key, required this.listing});

  @override
  EditPlateListingPageState createState() => EditPlateListingPageState();
}

class EditPlateListingPageState extends State<EditPlateListingPage> {
  late final TextEditingController _codeCtrl;
  late final TextEditingController _plateCtrl;
  late final TextEditingController _priceCtrl;
  late final TextEditingController _discountCtrl;
  bool _showDiscount = false;

  @override
  void initState() {
    super.initState();
    final l = widget.listing;
    _codeCtrl = TextEditingController(text: l.item.code);
    _plateCtrl = TextEditingController(text: l.item.number);
    _priceCtrl = TextEditingController(text: l.price.toString());
    _discountCtrl = TextEditingController(text: l.discountPrice > 0 ? l.discountPrice.toString() : '');
    _showDiscount = l.discountPrice > 0;
  }

  @override
  void dispose() {
    _codeCtrl.dispose();
    _plateCtrl.dispose();
    _priceCtrl.dispose();
    _discountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return BlocProvider<EditPlateListingCubit>(
      create: (_) => EditPlateListingCubit()
        ..loadListingData(
          listingId: widget.listing.id,
          code: widget.listing.item.code,
          plateNumber: widget.listing.item.number,
          price: widget.listing.price,
          discountPrice: widget.listing.discountPrice,
          isFeatured: widget.listing.isFeatured,
          isDisabled: widget.listing.isDisabled,
          isSold: widget.listing.isSold,
        ),
      child: Scaffold(
        appBar: AppBar(title: Text(m.editplate.title)),
        body: SafeArea(
          child: BlocBuilder<EditPlateListingCubit, EditPlateListingState>(
            builder: (context, state) {
              final cubit = context.read<EditPlateListingCubit>();

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.errorMessage != null) ...[
                      Text(state.errorMessage!, style: const TextStyle(color: Colors.red)),
                      const SizedBox(height: 8),
                    ],

                    // Code (read‑only)
                    TextField(
                      controller: _codeCtrl,
                      decoration: InputDecoration(labelText: m.editplaterequest.code),
                      enabled: false,
                    ),
                    const SizedBox(height: 16),

                    // Plate number (read‑only)
                    TextField(
                      controller: _plateCtrl,
                      decoration: InputDecoration(labelText: m.editplaterequest.number),
                      enabled: false,
                    ),
                    const SizedBox(height: 16),

                    // Price
                    TextField(
                      controller: _priceCtrl,
                      decoration: InputDecoration(labelText: m.editplaterequest.price_optional),
                      keyboardType: TextInputType.number,
                      enabled: !state.isSubmitting,
                      onChanged: cubit.updatePrice,
                    ),
                    const SizedBox(height: 16),

                    // Discount switch (UI only)
                    SwitchListTile(
                      title: Text(m.editphone.discount),
                      value: _showDiscount,
                      onChanged: state.isSubmitting
                          ? null
                          : (val) {
                              setState(() => _showDiscount = val);
                              if (!val) {
                                _discountCtrl.clear();
                                cubit.updateDiscountPrice('');
                              }
                            },
                    ),

                    // Discount price field
                    if (_showDiscount) ...[
                      const SizedBox(height: 16),
                      TextField(
                        controller: _discountCtrl,
                        decoration: InputDecoration(labelText: m.editplate.discount_price),
                        keyboardType: TextInputType.number,
                        enabled: !state.isSubmitting,
                        onChanged: cubit.updateDiscountPrice,
                      ),
                    ],

                    const SizedBox(height: 24),

                    if (state.isSubmitting)
                      const Center(child: CircularProgressIndicator())
                    else ...[
                      PromoteListingButton(listingId: widget.listing.id, itemType: ItemType.plateNumber),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          await cubit.submitEdit();
                          final s = cubit.state;
                          if (context.mounted && s.errorMessage == null && !s.isSubmitting) {
                            AutoRouter.of(context).maybePop();
                          }
                        },
                        child: Text(m.editplaterequest.save_changes, style: const TextStyle(color: Colors.white)),
                      ),
                    ]
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
