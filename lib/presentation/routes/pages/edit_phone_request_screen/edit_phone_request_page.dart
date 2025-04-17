import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_request_screen/cubit/edit_phone_request_cubit.dart';

@RoutePage()
class EditPhoneRequestPage extends StatefulWidget {
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
  State<EditPhoneRequestPage> createState() => _EditPhoneRequestPageState();
}

class _EditPhoneRequestPageState extends State<EditPhoneRequestPage> {
  late final TextEditingController numberController;
  late final TextEditingController priceController;

  @override
  void initState() {
    super.initState();

    numberController = TextEditingController(text: widget.initialNumber);
    priceController = TextEditingController(
      text: widget.initialPrice != null ? widget.initialPrice!.toString() : '',
    );

    final cubit = context.read<EditPhoneRequestCubit>();
    cubit.loadFromRequest(
      requestId: widget.requestId,
      number: widget.initialNumber,
      price: widget.initialPrice,
    );
  }

  @override
  void dispose() {
    numberController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditPhoneRequestCubit>(
      create: (_) => EditPhoneRequestCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Edit Phone Request")),
        body: SafeArea(
          child: BlocConsumer<EditPhoneRequestCubit, EditPhoneRequestState>(
            listener: (context, state) {
              if (!state.isSubmitting && state.errorMessage == null) {
                AutoRouter.of(context).maybePop(); // navigate away on success
              }
            },
            builder: (context, state) {
              final cubit = context.read<EditPhoneRequestCubit>();

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          state.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    TextField(
                      controller: numberController,
                      decoration:
                          const InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.phone,
                      enabled: false,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: priceController,
                      decoration:
                          const InputDecoration(labelText: 'Price (optional)'),
                      keyboardType: TextInputType.number,
                      enabled: !state.isSubmitting,
                      onChanged: cubit.updatePrice,
                    ),
                    const SizedBox(height: 24),
                    if (state.isSubmitting)
                      const Center(child: CircularProgressIndicator())
                    else
                      ElevatedButton(
                        onPressed: () => cubit.submitEdit(),
                        child: const Text("Save Changes",
                            style: TextStyle(color: Colors.white)),
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
