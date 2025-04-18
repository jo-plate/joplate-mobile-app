import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_request_screen/cubit/edit_phone_request_cubit.dart';

@RoutePage()
class EditPhoneRequestPage extends StatefulWidget {
  final PhoneRequest request;

  const EditPhoneRequestPage({super.key, required this.request});

  @override
  State<EditPhoneRequestPage> createState() => _EditPhoneRequestPageState();
}

class _EditPhoneRequestPageState extends State<EditPhoneRequestPage> {
  late final TextEditingController numberController;
  late final TextEditingController priceController;

  @override
  void initState() {
    super.initState();

    numberController = TextEditingController(text: widget.request.item.number);
    priceController =
        TextEditingController(text: widget.request.price.toString());
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
      create: (_) => EditPhoneRequestCubit()
        ..loadFromRequest(
          request: widget.request,
        ),
      child: Scaffold(
        appBar: AppBar(title: const Text("Edit Phone Request")),
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
                      onChanged: (s) {
                        cubit.updatePrice(s);
                        setState(() {
                          priceController.text = s;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    if (state.isSubmitting)
                      const Center(child: CircularProgressIndicator())
                    else
                      Row(
                        children: [
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                await cubit.submitEdit().then((value) {
                                  context.router.maybePop();
                                });
                              },
                              child: const Text("Save Changes",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
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
