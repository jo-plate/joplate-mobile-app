import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/cubit/add_plate_request_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/cubit/add_plate_request_state.dart';
import 'package:joplate/presentation/theme.dart';

class SinglePlateRequestForm extends StatelessWidget {
  const SinglePlateRequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPlateRequestCubit, PlateRequestState>(
      builder: (context, state) {
        final cubit = context.read<AddPlateRequestCubit>();

        final codeController = TextEditingController(text: state.code);
        final numberController = TextEditingController(text: state.number);
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
                controller: codeController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Code (required)'),
                onChanged: cubit.updateCode,
                enabled: !state.isSubmitting,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Number (required)'),
                onChanged: cubit.updateNumber,
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
