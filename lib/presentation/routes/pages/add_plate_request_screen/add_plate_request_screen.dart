import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/cubit/add_plate_request_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/cubit/add_plate_request_state.dart';

class AddPlateRequestScreen extends StatefulWidget {
  const AddPlateRequestScreen({Key? key}) : super(key: key);

  @override
  _AddPlateRequestScreenState createState() => _AddPlateRequestScreenState();
}

class _AddPlateRequestScreenState extends State<AddPlateRequestScreen> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _codeController.dispose();
    _numberController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context);
    return BlocBuilder<AddPlateRequestCubit, PlateRequestState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.addplaterequest.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _codeController,
                  decoration: InputDecoration(
                    labelText: l10n.addplaterequest.code,
                    hintText: l10n.addplaterequest.code,
                    errorText: state.errorMessage,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    context.read<AddPlateRequestCubit>().updateCode(value);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _numberController,
                  decoration: InputDecoration(
                    labelText: l10n.addplaterequest.number,
                    hintText: l10n.addplaterequest.required_plate_number,
                    errorText: state.errorMessage,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<AddPlateRequestCubit>().updateNumber(value);
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
                    context.read<AddPlateRequestCubit>().updateDescription(value);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: l10n.addplaterequest.optional_price,
                    hintText: l10n.addplaterequest.optional_price,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    final price = int.tryParse(value);
                    context.read<AddPlateRequestCubit>().updatePrice(price);
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: state.isSubmitting
                      ? null
                      : () {
                          context.read<AddPlateRequestCubit>().submitRequest();
                        },
                  child:
                      state.isSubmitting ? const CircularProgressIndicator() : Text(l10n.addplaterequest.save_button),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
