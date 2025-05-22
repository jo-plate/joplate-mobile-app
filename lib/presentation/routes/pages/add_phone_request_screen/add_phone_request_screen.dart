import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/add_phone_request_screen/cubit/add_phone_request_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_phone_request_screen/cubit/phone_request_state.dart';

class AddPhoneRequestScreen extends StatefulWidget {
  const AddPhoneRequestScreen({super.key});

  @override
  AddPhoneRequestScreenState createState() => AddPhoneRequestScreenState();
}

class AddPhoneRequestScreenState extends State<AddPhoneRequestScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context);
    return BlocBuilder<AddPhoneRequestCubit, PhoneRequestState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.addphonerequest.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: l10n.addphonerequest.phone_number_label,
                    hintText: l10n.addphonerequest.required_phone_number,
                    prefixText: '+962 ',
                    errorText: state.errorMessage,
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    context.read<AddPhoneRequestCubit>().updatePhoneNumber(value);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: l10n.common.description,
                    hintText: l10n.common.description_hint,
                    errorText: state.description.length > 150 ? l10n.common.description_too_long : null,
                  ),
                  maxLength: 150,
                  onChanged: (value) {
                    context.read<AddPhoneRequestCubit>().updateDescription(value);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: l10n.addphonerequest.optional_price,
                    hintText: l10n.addphonerequest.optional_price,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<AddPhoneRequestCubit>().updatePrice(value);
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: state.isSubmitting
                      ? null
                      : () {
                          context.read<AddPhoneRequestCubit>().submitRequest();
                        },
                  child:
                      state.isSubmitting ? const CircularProgressIndicator() : Text(l10n.addphonerequest.save_button),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
