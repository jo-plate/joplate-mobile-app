// lib/presentation/routes/pages/add_plate_request_screen/ui/add_plate_request_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/cubit/add_plate_request_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/cubit/add_plate_request_state.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/ui/single_plate_request_form.dart';

@RoutePage()
class AddPlateRequestPage extends StatelessWidget {
  const AddPlateRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return BlocProvider(
      create: (context) => AddPlateRequestCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(m.addplaterequest.title),
        ),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: BlocBuilder<AddPlateRequestCubit, PlateRequestState>(
            builder: (context, state) {
              final cubit = context.read<AddPlateRequestCubit>();
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SinglePlateRequestForm(),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: state.isSubmitting
                            ? null
                            : () async {
                                await cubit.submitRequest();
                                if (context.mounted && cubit.state.errorMessage == null && !cubit.state.isSubmitting) {
                                  AutoRouter.of(context).maybePop();
                                }
                              },
                        child: Text(m.addplaterequest.save_button, style: const TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
