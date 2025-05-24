import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_request_screen/cubit/edit_phone_request_cubit.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_request_screen/cubit/edit_phone_request_state.dart';

@RoutePage()
class EditPhoneRequestPage extends StatefulWidget {
  final PhoneRequest request;

  const EditPhoneRequestPage({super.key, required this.request});

  @override
  State<EditPhoneRequestPage> createState() => _EditPhoneRequestPageState();
}

class _EditPhoneRequestPageState extends State<EditPhoneRequestPage> {
  late final TextEditingController numberController;

  @override
  void initState() {
    super.initState();

    numberController = TextEditingController(text: widget.request.item.number);
  }

  @override
  void dispose() {
    numberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return BlocProvider<EditPhoneRequestCubit>(
      create: (_) => EditPhoneRequestCubit()
        ..loadFromRequest(
          request: widget.request,
        ),
      child: Scaffold(
        appBar: AppBar(title: Text(m.editphonerequest.title)),
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
                      decoration: InputDecoration(labelText: m.editphonerequest.phone_number),
                      keyboardType: TextInputType.phone,
                      enabled: !state.isSubmitting,
                      onChanged: cubit.updateNumber,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(labelText: m.common.description_optional, alignLabelWithHint: true),
                      maxLines: 3,
                      enabled: !state.isSubmitting,
                      textAlign: TextAlign.justify,
                      textAlignVertical: TextAlignVertical.top,
                      onChanged: cubit.updateDescription,
                    ),
                    const SizedBox(height: 16),
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
                              child: Text(m.editphonerequest.save_changes, style: const TextStyle(color: Colors.white)),
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
