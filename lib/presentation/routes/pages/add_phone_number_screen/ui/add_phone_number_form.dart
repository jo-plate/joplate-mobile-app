import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/add_number_input.dart';
import 'package:joplate/presentation/theme.dart';

class AddPhoneNumberForm extends StatefulWidget {
  const AddPhoneNumberForm({super.key, this.onSuccess});

  final Function(AddPhoneNumberInput input)? onSuccess;

  @override
  State<AddPhoneNumberForm> createState() => _AddPhoneNumberFormState();
}

class _AddPhoneNumberFormState extends State<AddPhoneNumberForm> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  bool _withDiscount = false;
  bool _isLoading = false;

  @override
  void dispose() {
    numberController.dispose();
    priceController.dispose();
    discountController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (numberController.text.isEmpty || priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final input = AddPhoneNumberInput(
      number: numberController.text,
      price: int.parse(priceController.text),
      discountPrice: _withDiscount ? int.tryParse(discountController.text) : null,
    );

    final addListingDto = AddListingDto(
      price: input.price.toDouble(),
      discountPrice: input.discountPrice?.toDouble() ?? 0,
      listingType: ListingType.ad,
      itemType: ItemType.phoneNumber,
      priceNegotiable: true,
      priceHidden: false,
      isFeatured: false,
      itemData: {
        "number": input.number,
      },
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(createListingCF);
      final response = await callable.call(addListingDto.toJson());

      if (response.data != null && response.data['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Listing added successfully!')),
        );
        widget.onSuccess?.call(input);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add listing.')),
        );
      }
    } on FirebaseFunctionsException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardContainerStyle,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: numberController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Number'),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Price'),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("With Discount?", style: TextStyle(fontSize: 16)),
              Switch(
                value: _withDiscount,
                onChanged: (value) {
                  setState(() {
                    _withDiscount = value;
                  });
                },
              ),
            ],
          ),
          if (_withDiscount)
            TextField(
              controller: discountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Discount Price'),
            ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: FilledButton(onPressed: _isLoading ? null : () {}, child: const Text("Add another"))),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton(
                  onPressed: _isLoading ? null : _submit,
                  child: _isLoading ? const CircularProgressIndicator() : const Text("Next"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
