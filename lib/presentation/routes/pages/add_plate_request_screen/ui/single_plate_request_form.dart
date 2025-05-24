// lib/presentation/routes/pages/add_plate_request_screen/ui/single_plate_request_form.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/plate_code_picker_field.dart';
import 'package:joplate/presentation/widgets/plate_number_field.dart';
import '../cubit/add_plate_request_cubit.dart';
import '../cubit/add_plate_request_state.dart';
import 'package:joplate/presentation/theme.dart';

class SinglePlateRequestForm extends StatefulWidget {
  const SinglePlateRequestForm({super.key});

  @override
  State<SinglePlateRequestForm> createState() => _SinglePlateRequestFormState();
}

class _SinglePlateRequestFormState extends State<SinglePlateRequestForm> {
  late final TextEditingController codeController;
  late final TextEditingController numberController;
  // late final TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AddPlateRequestCubit>();
    final state = cubit.state;

    codeController = TextEditingController(text: state.code);
    numberController = TextEditingController(text: state.number);
    // priceController = TextEditingController(text: state.price ?? '');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.read<AddPlateRequestCubit>().state;
    _maybeSyncText(codeController, state.code);
    _maybeSyncText(numberController, state.number);
    // _maybeSyncText(priceController, state.price ?? '');
  }

  @override
  void dispose() {
    codeController.dispose();
    numberController.dispose();
    // priceController.dispose();
    super.dispose();
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
    return BlocBuilder<AddPlateRequestCubit, PlateRequestState>(
      builder: (context, state) {
        final cubit = context.read<AddPlateRequestCubit>();

        return Container(
          decoration: getCardContainerStyle(context),
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state.errorMessage != null)
                  Text(
                    state.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 8),
                PlateCodePickerField(
                  value: state.code,
                  enabled: !state.isSubmitting,
                  onChanged: cubit.updateCode,
                  controller: codeController,
                ),
                const SizedBox(height: 16),
                PlateNumberField(
                  value: state.number,
                  enabled: !state.isSubmitting,
                  onChanged: cubit.updateNumber,
                  controller: numberController,
                ),
                const SizedBox(height: 16),
                TextField(
                  maxLines: 3,
                  maxLength: 150,
                  enabled: !state.isSubmitting,
                  decoration: InputDecoration(
                    labelText: m.common.description_optional,
                    hintText: m.common.description_hint,
                    errorText: state.description.length > 150 ? m.common.description_too_long : null,
                    alignLabelWithHint: true,
                  ),
                  textAlign: TextAlign.justify,
                  textAlignVertical: TextAlignVertical.top,
                  onChanged: cubit.updateDescription,
                ),
                const SizedBox(height: 16),
                if (state.isSubmitting) const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        );
      },
    );
  }
}
