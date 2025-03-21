// lib/presentation/routes/pages/add_phone_request_screen/ui/single_phone_request_form.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/add_phone_request_screen/cubit/add_phone_request_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_phone_request_screen/cubit/phone_request_state.dart';
import 'package:joplate/presentation/theme.dart';

class SinglePhoneRequestForm extends StatelessWidget {
  const SinglePhoneRequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPhoneRequestCubit, PhoneRequestState>(
      builder: (context, state) {
        final cubit = context.read<AddPhoneRequestCubit>();

        // Build controllers from state
        final phoneController = TextEditingController(text: state.phoneNumber);
        final priceController = TextEditingController(text: state.price ?? '');

        return Container(
          decoration: cardContainerStyle,
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
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Phone Number (required)'),
                onChanged: cubit.updatePhoneNumber,
                enabled: !state.isSubmitting,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price (optional)'),
                onChanged: cubit.updatePrice,
                enabled: !state.isSubmitting,
              ),
              const SizedBox(height: 16),
              if (state.isSubmitting) const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }
}
