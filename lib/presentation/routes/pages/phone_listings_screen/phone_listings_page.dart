import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_listing_grid.dart';

@RoutePage()
class PhoneListingsPage extends StatefulWidget {
  const PhoneListingsPage({super.key});

  @override
  State<PhoneListingsPage> createState() => _PhoneListingsPageState();
}

class _PhoneListingsPageState extends State<PhoneListingsPage> {
  String? _selectedCode;
  String? _selectedDigits;
  String? _selectedFormat;
  bool _isExpanded = false;

  final _containsController = TextEditingController();
  final _startsWithController = TextEditingController();
  final _endsWithController = TextEditingController();
  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();

  final List<String> _company = ['Zain', 'Orange', 'Umniah'];
  final List<String> _digitCounts = ['1 Digit', '2 Digits', '3 Digits', '4 Digits', '5 Digits'];
  final List<String> formatList = [
    "Format",
    "Contains Digit Repeated 2 Times",
    "Contains Digit Repeated 3 Times",
    "Contains Digit Repeated 4 Times",
  ];

  final List<PhoneNumber> _allPhones = PhoneNumber.mockList(20);

  late List<PhoneNumber> _filteredPhones;

  @override
  void initState() {
    super.initState();
    _filteredPhones = _allPhones;
  }

  void _onSearch() {
    // setState(() {
    //   _filteredPhones = _allPhones.where((plate) {
    //     bool matchesDigits = true;
    //     if (_selectedDigits == '4 Digits') {
    //       matchesDigits = plate.number.length == 4;
    //     } else if (_selectedDigits == '5 Digits') {
    //       matchesDigits = plate.number.length == 5;
    //     }

    //     return matchesDigits;
    //   }).toList();
    // });
  }

  InputDecoration get inputFieldStyle => InputDecoration(
        labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Numbers'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30,
            color: const Color(0xFF981C1E),
            onPressed: () {
              context.router.push(const AddPhoneNumberRoute());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Dropdown Filters (Always Visible)
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: inputFieldStyle.copyWith(labelText: 'Company'),
                    value: _selectedCode,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.red),
                    items: _company.map((c) {
                      return DropdownMenuItem(
                        value: c,
                        child: Text(c, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedCode = val),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 8),

            // Expandable Filters
            if (_isExpanded) ...[
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          controller: _containsController,
                          decoration: inputFieldStyle.copyWith(labelText: 'Contains'))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: TextFormField(
                          controller: _startsWithController,
                          decoration: inputFieldStyle.copyWith(labelText: 'Starts With'))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: TextFormField(
                          controller: _endsWithController,
                          decoration: inputFieldStyle.copyWith(labelText: 'Ends With'))),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          controller: _minPriceController,
                          keyboardType: TextInputType.number,
                          decoration: inputFieldStyle.copyWith(labelText: 'Min Price'))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: TextFormField(
                          controller: _maxPriceController,
                          keyboardType: TextInputType.number,
                          decoration: inputFieldStyle.copyWith(labelText: 'Max Price'))),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _onSearch,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      minimumSize: const Size(80, 40), // Smaller button size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Search",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // Smaller text
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
            ],

            GestureDetector(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Row(
                children: [
                  Text(_isExpanded ? 'Show Less' : 'See More',
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.red),
                ],
              ),
            ),

            const SizedBox(height: 8),
            PhonesListingGrid(itemList: _filteredPhones),
          ],
        ),
      ),
    );
  }
}
