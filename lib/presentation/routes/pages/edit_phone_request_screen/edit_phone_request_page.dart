import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_request_screen/cubit/edit_phone_request_cubit.dart';

@RoutePage()
class EditPhoneRequestPage extends StatelessWidget {
  final String requestId;
  final String initialNumber;
  final double? initialPrice;

  const EditPhoneRequestPage({
    super.key,
    required this.requestId,
    required this.initialNumber,
    this.initialPrice,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditPhoneRequestCubit>(
      create: (_) {
        final cubit = EditPhoneRequestCubit();
        cubit.loadRequestData(
          requestId: requestId,
          number: initialNumber,
          price: initialPrice,
        );
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Phone Request"),
        ),
        body: SafeArea(
          child: BlocBuilder<EditPhoneRequestCubit, EditPhoneRequestState>(
            builder: (context, state) {
              final cubit = context.read<EditPhoneRequestCubit>();

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
                      decoration: const InputDecoration(labelText: 'Phone Number'),
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
