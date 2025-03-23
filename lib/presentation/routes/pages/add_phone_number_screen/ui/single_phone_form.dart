import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/cubit/add_phone_numbers_cubit.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/cubit/phone_form_state.dart';

class SinglePhoneForm extends StatelessWidget {
  SinglePhoneForm({
    super.key,
    required this.index,
    required this.onNumberChanged,
    required this.onPriceChanged,
    required this.onDiscountChanged,
    required this.onDiscountToggle,
    this.onRemoveForm,
  });

  final int index;

  final ValueChanged<String> onNumberChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<String> onDiscountChanged;
  final ValueChanged<bool> onDiscountToggle;
  final VoidCallback? onRemoveForm;

  final TextEditingController numberController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPhoneNumbersCubit, AddPhoneNumbersState>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.forms[index].errorMessage != null)
                      Text(
                        state.forms[index].errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    TextField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      onChanged: onNumberChanged,
                      decoration: const InputDecoration(labelText: 'Number'),
                      enabled: !state.forms[index].isSubmitting,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      onChanged: onPriceChanged,
                      decoration: const InputDecoration(labelText: 'Price'),
                      enabled: !state.forms[index].isSubmitting,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("With Discount?", style: TextStyle(fontSize: 16)),
                        Switch(
                          value: state.forms[index].withDiscount,
                          onChanged: state.forms[index].isSubmitting ? null : onDiscountToggle,
                        ),
                      ],
                    ),
                    if (state.forms[index].withDiscount)
                      TextField(
                        controller: discountController,
                        keyboardType: TextInputType.number,
                        onChanged: onDiscountChanged,
                        decoration: const InputDecoration(labelText: 'Discount Price'),
                        enabled: !state.forms[index].isSubmitting,
                      ),
                    const SizedBox(height: 16),
                    if (state.forms[index].isSubmitting) const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
            if (index != 0)
              Positioned(
                right: -14,
                top: 0,
                child: GestureDetector(
                  onTap: state.forms[index].isSubmitting ? null : onRemoveForm,
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFF981C1E),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
