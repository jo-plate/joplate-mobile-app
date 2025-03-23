// lib/presentation/routes/pages/add_phone_number_screen/ui/add_multiple_phones_page.dart

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
                        return SinglePhoneForm(
                          index: index,
                          onNumberChanged: (val) => cubit.updateNumber(index, val),
                          onPriceChanged: (val) => cubit.updatePrice(index, val),
                          onDiscountChanged: (val) => cubit.updateDiscountPrice(index, val),
                          onDiscountToggle: (val) => cubit.toggleDiscount(index, val),
                          onRemoveForm: () => cubit.removeForm(index),

                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Button to add another phone form
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text(
                        "Add Another",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => cubit.addNewForm(),
                    ),

                    const SizedBox(height: 24),

                    // Button to submit all forms
                    ElevatedButton(
                      child: const Text(
                        "Submit All",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        await cubit.submitAllForms();

                        // If after submission, forms is empty -> success
                        if (cubit.state.forms.isEmpty) {
                          AutoRouter.of(context).maybePop();
                        }
                      },
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
