import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/cubit/add_phone_numbers_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/cubit/phone_form_state.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/ui/single_phone_form.dart';
import 'package:joplate/presentation/routes/router.dart'; // import your router
import 'package:joplate/presentation/widgets/app_snackbar.dart';

@RoutePage()
class AddPhoneNumberPage extends StatelessWidget {
  const AddPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return BlocProvider(
      create: (_) => AddPhoneNumbersCubit()..addNewForm(),
      child: Scaffold(
        appBar: AppBar(title: Text(m.addphonenumber.title)),
        body: BlocBuilder<AddPhoneNumbersCubit, AddPhoneNumbersState>(
          builder: (context, state) {
            final cubit = context.read<AddPhoneNumbersCubit>();

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListView.builder(
                      itemCount: state.forms.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final form = state.forms[index];
                        return SinglePhoneForm(
                          key: ValueKey('PhoneForm-$index'),
                          index: index,
                          formState: form,
                          onNumberChanged: (val) => cubit.updateNumber(index, val),
                          onPriceChanged: (val) => cubit.updatePrice(index, val),
                          onDiscountChanged: (val) => cubit.updateDiscountPrice(index, val),
                          onDiscountToggle: (val) => cubit.toggleDiscount(index, val),
                          onRemoveForm: () => cubit.removeForm(index),
                          onFeaturedToggle: (val) => cubit.toggleFeatured(index, val),
                          onCallForPriceToggle: (val) => cubit.toggleCallForPrice(index, val),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: Text(m.addphonenumber.addmore, style: const TextStyle(color: Colors.white)),
                            onPressed: () => cubit.addNewForm(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              await cubit.submitAllForms(
                                onSuccess: (listingId) {
                                  AutoRouter.of(context).replace(PhoneDetailsRoute(listingId: listingId));
                                },
                                onError: (msg) {
                                  AppSnackbar.showError(msg);
                                },
                              );
                            },
                            child: Text(m.addphonenumber.save_button, style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
