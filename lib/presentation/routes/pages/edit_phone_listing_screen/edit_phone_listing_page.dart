import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_listing_screen/cubit/edit_phone_listing_cubit.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/promote_listing_button.dart';

@RoutePage()
class EditPhoneListingPage extends StatefulWidget {
  final PhoneListing listing;
  const EditPhoneListingPage({super.key, required this.listing});

  @override
  EditPhoneListingPageState createState() => EditPhoneListingPageState();
}

class EditPhoneListingPageState extends State<EditPhoneListingPage> {
  late final TextEditingController _numberCtrl;
  late final TextEditingController _priceCtrl;
  late final TextEditingController _discountCtrl;
  bool _showDiscount = false;

  @override
  void initState() {
    super.initState();
    final l = widget.listing;
    _numberCtrl = TextEditingController(text: l.item.number);
    _priceCtrl = TextEditingController(text: l.price.toString());
    _discountCtrl = TextEditingController(text: l.discountPrice.toString());
    _showDiscount = (l.discountPrice > 0);
  }

  @override
  void dispose() {
    _numberCtrl.dispose();
    _priceCtrl.dispose();
    _discountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return BlocProvider<EditPhoneListingCubit>(
      create: (_) => EditPhoneListingCubit()..loadListing(widget.listing),
      child: BlocBuilder<EditPhoneListingCubit, EditPhoneListingState>(
        builder: (context, state) {
          final cubit = context.read<EditPhoneListingCubit>();

          return Scaffold(
            appBar: AppBar(title: Text(m.editphone.title)),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.errorMessage != null) ...[
                      Text(
                        state.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 8),
                    ],

                    // Phone number (read‑only)
                    TextField(
                      controller: _numberCtrl,
                      decoration: InputDecoration(labelText: m.editphone.phone_number),
                      enabled: false,
                    ),
                    const SizedBox(height: 16),

                    // Price
                    TextField(
                      controller: _priceCtrl,
                      decoration: InputDecoration(labelText: m.editphone.price),
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
                        decoration: InputDecoration(labelText: m.editphone.discount_price),
                        keyboardType: TextInputType.number,
                        enabled: !state.isSubmitting,
                        onChanged: cubit.updateDiscountPrice,
                      ),
                    ],

                    const SizedBox(height: 24),

                    if (state.isSubmitting)
                      const Center(child: CircularProgressIndicator())
                    else ...[
                      PromoteListingButton(listingId: widget.listing.id, itemType: ItemType.phoneNumber),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          await cubit.submitEdit();
                          final s = cubit.state;
                          if (context.mounted && s.errorMessage == null && !s.isSubmitting) {
                            AutoRouter.of(context).maybePop();
                          }
                        },
                        child: Text(
                          m.editphone.save_changes,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
