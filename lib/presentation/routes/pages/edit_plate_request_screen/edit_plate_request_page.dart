import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_request_screen/cubit/edit_plate_request_cubit.dart';

@RoutePage()
class EditPlateRequestPage extends StatelessWidget {
  final String requestId; // Or receive as route argument
  final String initialCode;
  final String initialNumber;
  final double? initialPrice;

  const EditPlateRequestPage({
    super.key,
    required this.requestId,
    required this.initialCode,
    required this.initialNumber,
    this.initialPrice,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditPlateRequestCubit>(
      create: (_) {
        final cubit = EditPlateRequestCubit();
        // Load initial data for the form
        cubit.loadRequestData(
          requestId: requestId,
          code: initialCode,
          number: initialNumber,
          price: initialPrice,
        );
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Plate Request"),
        ),
        body: SafeArea(
          child: BlocBuilder<EditPlateRequestCubit, EditPlateRequestState>(
            builder: (context, state) {
              final cubit = context.read<EditPlateRequestCubit>();

              return SingleChildScrollView(
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
                      decoration: const InputDecoration(labelText: 'Code'),
                      onChanged: cubit.updateCode,
                      enabled: !state.isSubmitting,
                      controller: TextEditingController(text: state.code),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Number'),
                      onChanged: cubit.updateNumber,
                      enabled: !state.isSubmitting,
                      controller: TextEditingController(text: state.number),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Price (optional)'),
                      onChanged: cubit.updatePrice,
                      enabled: !state.isSubmitting,
                      controller: TextEditingController(text: state.price),
                    ),
                    const SizedBox(height: 16),
                    if (state.isSubmitting) const Center(child: CircularProgressIndicator()),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: state.isSubmitting
                          ? null
                          : () async {
                              await cubit.submitEdit();
                              if (cubit.state.errorMessage == null && !cubit.state.isSubmitting) {
                                // e.g., pop or navigate away on success
                                AutoRouter.of(context).maybePop();
                              }
                            },
                      child: const Text("Save Changes"),
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
