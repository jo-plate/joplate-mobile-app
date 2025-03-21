// lib/presentation/routes/pages/add_plate_request_screen/ui/add_plate_request_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/cubit/add_plate_request_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/cubit/add_plate_request_state.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/ui/single_plate_request_form.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class AddPlateRequestPage extends StatelessWidget {
  const AddPlateRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPlateRequestCubit>(
      create: (_) => AddPlateRequestCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Plate Request"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SinglePlateRequestForm(),
                const SizedBox(height: 24),
                BlocBuilder<AddPlateRequestCubit, PlateRequestState>(
                  builder: (context, state) {
                    final cubit = context.read<AddPlateRequestCubit>();

                    return ElevatedButton(
                      onPressed: state.isSubmitting
                          ? null
                          : () async {
                              await cubit.submitRequest();
                              // If submission succeeded, form is reset
                              if (cubit.state.errorMessage == null &&
                                  !cubit.state.isSubmitting &&
                                  cubit.state.code.isEmpty &&
                                  cubit.state.number.isEmpty &&
                                  (cubit.state.price ?? '').isEmpty) {
                                // e.g., navigate away
                                AutoRouter.of(context).replace(const MyRequestsRoute());

                              }
                            },
                      child: const Text("Submit", style: TextStyle(color: Colors.white)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
