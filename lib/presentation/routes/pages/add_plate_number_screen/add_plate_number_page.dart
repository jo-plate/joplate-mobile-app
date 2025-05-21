import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/cubit/add_plate_numbers_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/cubit/plate_form_state.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/ui/single_plate_form.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

@RoutePage()
class AddPlateNumberPage extends StatefulWidget {
  const AddPlateNumberPage({super.key});

  @override
  State<AddPlateNumberPage> createState() => _AddPlateNumberPageState();
}

class _AddPlateNumberPageState extends State<AddPlateNumberPage> {
  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return BlocProvider(
      create: (_) => AddPlateNumbersCubit()..addNewForm(),
      child: Scaffold(
        appBar: AppBar(title: Text(m.addplate.title)),
        body: BlocBuilder<AddPlateNumbersCubit, AddPlateNumbersState>(
          builder: (context, state) {
            final cubit = context.read<AddPlateNumbersCubit>();

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListView.builder(
                      itemCount: state.forms.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final form = state.forms[index];
                        return SinglePlateForm(
                          key: ValueKey('PlateForm-$index'),
                          index: index,
                          formState: form,
                          onCodeChanged: (val) => cubit.updateCode(index, val),
                          onNumberChanged: (val) => cubit.updateNumber(index, val),
                          onPriceChanged: (val) => cubit.updatePrice(index, val),
                          onDiscountChanged: (val) => cubit.updateDiscountPrice(index, val),
                          onDiscountToggle: (val) => cubit.toggleDiscount(index, val),
                          onRemoveForm: () => cubit.removeForm(index),
                          onFeaturedToggle: (val) => cubit.toggleFeatured(index, val),
                          onCallForPriceToggle: (val) => cubit.toggleCallForPrice(index, val),
                          onDescriptionChanged: (val) => cubit.updateDescription(index, val),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: Text(m.addplate.addmore, style: const TextStyle(color: Colors.white)),
                            onPressed: () => cubit.addNewForm(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              await cubit.submitAllForms(
                                onSuccess: (listingId) {
                                  AutoRouter.of(context).replace(PlatesDetailsRoute(listingId: listingId));
                                },
                                onError: (msg) {
                                  AppSnackbar.showError(msg);
                                },
                              );
                            },
                            child: Text(m.addplate.save_button, style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
