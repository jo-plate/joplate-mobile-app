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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final state = context.read<AddPhoneRequestCubit>().state;
    phoneController = TextEditingController(text: state.phoneNumber);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.read<AddPhoneRequestCubit>().state;
    _maybeSyncText(phoneController, state.phoneNumber);
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

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!value.startsWith('077') && !value.startsWith('078') && !value.startsWith('079')) {
      return 'Phone number must start with 077, 078, or 079';
    }
    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
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
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: m.addphonerequest.required_phone_number,
                    hintText: "07XXXXXXXX",
                    errorMaxLines: 2,
                  ),
                  onChanged: cubit.updatePhoneNumber,
                  maxLength: 10,
                  enabled: !state.isSubmitting,
                  validator: _validatePhoneNumber,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16),
                TextField(
                  maxLines: 3,
                  maxLength: 150,
                  enabled: !state.isSubmitting,
                  decoration: InputDecoration(
                    labelText: m.common.description,
                    hintText: m.common.description_hint,
                    errorText: state.description.length > 150 ? m.common.description_too_long : null,
                  ),
                  textAlign: TextAlign.justify,
                  textAlignVertical: TextAlignVertical.top,
                  onChanged: cubit.updateDescription,
                ),
                if (state.isSubmitting) const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        );
      },
    );
  }
}
