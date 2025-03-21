import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/cubit/add_plate_numbers_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/cubit/plate_form_state.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/ui/single_plate_form.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class AddPlateNumberPage extends StatefulWidget {
  const AddPlateNumberPage({super.key});

  @override
  State<AddPlateNumberPage> createState() => _AddPlateNumberPageState();
}

class _AddPlateNumberPageState extends State<AddPlateNumberPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPlateNumbersCubit>(
      create: (_) => AddPlateNumbersCubit()..addNewForm(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Add Plate Numbers")),
        body: SafeArea(
          child: BlocBuilder<AddPlateNumbersCubit, AddPlateNumbersState>(
            builder: (context, state) {
              final cubit = context.read<AddPlateNumbersCubit>();

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Render a SinglePlateForm for each item
                    ListView.builder(
                      itemCount: state.forms.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final form = state.forms[index];
                        return SinglePlateForm(
                          index: index,
                          formState: form,
                          onCodeChanged: (val) => cubit.updateCode(index, val),
                          onNumberChanged: (val) => cubit.updateNumber(index, val),
                          onPriceChanged: (val) => cubit.updatePrice(index, val),
                          onDiscountChanged: (val) => cubit.updateDiscountPrice(index, val),
                          onDiscountToggle: (val) => cubit.toggleDiscount(index, val),
                        );
                      },
                    ),

                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "Add more",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => cubit.addNewForm(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            child: const Text("Submit", style: TextStyle(color: Colors.white)),
                            onPressed: () async {
                              await cubit.submitAllForms();
                              if (cubit.state.forms.isEmpty) {
                                // e.g., go to MyNumbersRoute on success
                                AutoRouter.of(context).replace(const MyNumbersRoute());
                              }
                            },
                          ),
                        ),
                      ],
                    )
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
