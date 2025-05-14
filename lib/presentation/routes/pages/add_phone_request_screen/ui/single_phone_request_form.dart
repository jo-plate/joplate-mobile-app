// lib/presentation/routes/pages/add_phone_request_screen/ui/single_phone_request_form.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import '../cubit/add_phone_request_cubit.dart';
import '../cubit/phone_request_state.dart';
import 'package:joplate/presentation/theme.dart';

class SinglePhoneRequestForm extends StatefulWidget {
  const SinglePhoneRequestForm({super.key});

  @override
  State<SinglePhoneRequestForm> createState() => _SinglePhoneRequestFormState();
}

class _SinglePhoneRequestFormState extends State<SinglePhoneRequestForm> {
  late final TextEditingController phoneController;
  // late final TextEditingController priceController;

  @override
  void initState() {
    super.initState();

    // Read initial state
    final state = context.read<AddPhoneRequestCubit>().state;
    phoneController = TextEditingController(text: state.phoneNumber);
    // priceController = TextEditingController(text: state.price ?? '');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // If the cubit updates the data from outside, we can sync the controllers
    final state = context.read<AddPhoneRequestCubit>().state;
    _maybeSyncText(phoneController, state.phoneNumber);
    // _maybeSyncText(priceController, state.price ?? '');
  }

  void _maybeSyncText(TextEditingController controller, String newText) {
    if (controller.text != newText) {
      final selection = controller.selection;
      controller.text = newText;
      final length = newText.length;
      controller.selection = selection.copyWith(
        baseOffset: length,
        extentOffset: length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return BlocBuilder<AddPhoneRequestCubit, PhoneRequestState>(
      builder: (context, state) {
        final cubit = context.read<AddPhoneRequestCubit>();

        return Container(
          decoration: getCardContainerStyle(context),
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

              // Required phone number
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: m.addphonerequest.required_phone_number, hintText: "07XXXXXXXX"),
                onChanged: cubit.updatePhoneNumber,
                maxLength: 10,
                enabled: !state.isSubmitting,
              ),
              // const SizedBox(height: 16),

              // // Optional Price
              // TextField(
              //   controller: priceController,
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(labelText: m.addphonerequest.optional_price),
              //   onChanged: cubit.updatePrice,
              //   enabled: !state.isSubmitting,
              // ),
              // const SizedBox(height: 16),

              if (state.isSubmitting) const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }
}
