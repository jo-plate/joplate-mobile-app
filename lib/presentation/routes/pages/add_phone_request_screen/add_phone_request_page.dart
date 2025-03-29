// lib/presentation/routes/pages/add_phone_request_screen/ui/add_phone_request_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/add_phone_request_screen/cubit/add_phone_request_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_phone_request_screen/cubit/phone_request_state.dart';
import 'package:joplate/presentation/routes/pages/add_phone_request_screen/ui/single_phone_request_form.dart';

import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class AddPhoneRequestPage extends StatelessWidget {
  const AddPhoneRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return BlocProvider<AddPhoneRequestCubit>(
      create: (_) => AddPhoneRequestCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(m.addphonerequest.title),
        ),
        body: SafeArea(
          child: BlocBuilder<AddPhoneRequestCubit, PhoneRequestState>(
            builder: (context, state) {
              final cubit = context.read<AddPhoneRequestCubit>();

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // The single request form
                    const SinglePhoneRequestForm(),
                    const SizedBox(height: 24),

                    // Submit button
                    ElevatedButton(
                      onPressed: state.isSubmitting
                          ? null
                          : () async {
                              await cubit.submitRequest();
                              // If submission succeeded, the form is reset
                              if (cubit.state.errorMessage == null &&
                                  !cubit.state.isSubmitting &&
                                  cubit.state.phoneNumber.isEmpty &&
                                  (cubit.state.price ?? '').isEmpty) {
                                // e.g., navigate away
                                AutoRouter.of(context).replace(const MyRequestsRoute());
                              }
                            },
                      child: Text(m.addphonerequest.save_button, style: TextStyle(color: Colors.white)),
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
