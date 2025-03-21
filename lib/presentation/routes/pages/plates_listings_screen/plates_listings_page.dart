import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plates_listing_grid.dart';

@RoutePage()
class PlatesListingsPage extends StatefulWidget {
  const PlatesListingsPage({super.key});

  @override
  State<PlatesListingsPage> createState() => _PlatesListingsPageState();
}

class _PlatesListingsPageState extends State<PlatesListingsPage> {
  String? _selectedCode;
  String? _selectedDigits;
  String? _selectedFormat;
  bool _isExpanded = false;

  final _containsController = TextEditingController();
  final _startsWithController = TextEditingController();
  final _endsWithController = TextEditingController();
  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();

  final List<String> _codes = ['10', '20', '30', '40', '50', '60', '70', '80'];
  final List<String> _digitCounts = ['1 Digit', '2 Digits', '3 Digits', '4 Digits', '5 Digits'];
  final List<String> formatList = [
    "Format",
    "Contains Digit Repeated 2 Times",
    "Contains Digit Repeated 3 Times",
    "Contains Digit Repeated 4 Times",
    "X???X (5 Digits)",
    "XYZYX (5 Digits)",
    "XXXZX (5 Digits)",
    "?XXX? (5 Digits)",
    "XYXYX (5 Digits)",
    "XYYYX (5 Digits)",
    "??XXX (5 Digits)",
    "XXX?? (5 Digits)",
    "XXXXX (5 Digits)",
    "X??X (4 Digits)",
    "XYXX (4 Digits)",
    "XYXY (4 Digits)",
    "?XX? (4 Digits)",
    "XXXY (4 Digits)",
    "XYYY (4 Digits)",
    "XXXX (4 Digits)",
    "XYX (3 Digits)",
    "XYZ (3 Digits)",
    "XYY (3 Digits)",
    "XXY (3 Digits)",
    "XXX (3 Digits)",
  ];

  late final Stream<List<PlateNumber>> _platesStream;

  @override
  void initState() {
    super.initState();
    // where ads array size > 0
    _platesStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('adsCount', isGreaterThan: 0)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PlateNumber.fromJson(doc.data())).toList());
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
        title: const Text('Car Numbers'),
        centerTitle: true,
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
                    decoration: inputFieldStyle.copyWith(labelText: 'Code'),
                    value: _selectedCode,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.red),
                    items: _codes.map((c) {
                      return DropdownMenuItem(
                        value: c,
                        child: Text(c, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedCode = val),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: inputFieldStyle.copyWith(labelText: 'Digit Count'),
                    value: _selectedDigits,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.red),
                    items: _digitCounts.map((d) {
                      return DropdownMenuItem(
                        value: d,
                        child: Text(d, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedDigits = val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              decoration: inputFieldStyle.copyWith(labelText: 'Format'),
              value: _selectedFormat,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.red),
              items: formatList.map((format) {
                return DropdownMenuItem(
                  value: format,
                  child: Text(format, style: const TextStyle(fontSize: 14)),
                );
              }).toList(),
              onChanged: (val) => setState(() => _selectedFormat = val),
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
                    onPressed: () {},
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
            StreamBuilder<List<PlateNumber>>(
                stream: _platesStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return PlatesListingsGrid(itemList: snapshot.data ?? []);
                }),
          ],
        ),
      ),
    );
  }
}
