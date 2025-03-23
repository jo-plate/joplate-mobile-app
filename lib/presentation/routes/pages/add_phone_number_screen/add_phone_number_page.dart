// lib/presentation/routes/pages/add_phone_number_screen/ui/add_phone_number_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/cubit/add_phone_numbers_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/cubit/phone_form_state.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/ui/single_phone_form.dart';

@RoutePage()
class AddPhoneNumberPage extends StatelessWidget {
  const AddPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPhoneNumbersCubit>(
      create: (_) => AddPhoneNumbersCubit()..addNewForm(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Add Phone Numbers")),
        body: SafeArea(
          child: BlocBuilder<AddPhoneNumbersCubit, AddPhoneNumbersState>(
            builder: (context, state) {
              final cubit = context.read<AddPhoneNumbersCubit>();

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Render a SinglePhoneForm for each item
                    ListView.builder(
                      itemCount: state.forms.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final form = state.forms[index];

                        // Provide a stable key so each form retains its controller state
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
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // "Add More" + "Submit"
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: const Text("Add more", style: TextStyle(color: Colors.white)),
                            onPressed: () => cubit.addNewForm(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              await cubit.submitAllForms();
                              if (cubit.state.forms.isEmpty) {
                                // e.g., navigate away on success
                                AutoRouter.of(context).maybePop();
                              }
                            },
                            child: const Text("Submit", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
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
