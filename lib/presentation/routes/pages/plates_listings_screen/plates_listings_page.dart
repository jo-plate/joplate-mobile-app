import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
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

  final List<String> _codes = [
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '77',
    '80',
    '88',
  ];

  final List<String> _digitCountsEN = ['1 Digit', '2 Digits', '3 Digits', '4 Digits', '5 Digits'];
  final List<String> _digitCountsAR = ['أحادي', 'ثنائي', 'ثلاثي', 'رباعي', 'خماسي'];

  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>> _sub;
  List<PlateListing> _allPlates = [];

  @override
  void initState() {
    super.initState();

    _sub = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('isDisabled', isEqualTo: false)
        .where('expiresAt', isGreaterThan: DateTime.now())
        .orderBy('isSold', descending: false)
        .orderBy('featuredUntil', descending: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snap) {
      setState(() {
        _allPlates = snap.docs.map((doc) => PlateListing.fromSnapshot(doc)).where((e) => !e.isExpired).toList();
      });
    });

    for (final controller in [
      _containsController,
      _startsWithController,
      _endsWithController,
      _minPriceController,
      _maxPriceController
    ]) {
      controller.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _sub.cancel();
    _containsController.dispose();
    _startsWithController.dispose();
    _endsWithController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  Map<String, String> getFormatMap(BuildContext context) {
    final f = Localization.of(context).formats;
    return {
      'repeat_2': f.repeat_2,
      'repeat_3': f.repeat_3,
      'repeat_4': f.repeat_4,
      'f_5_1': f.f_5_1,
      'f_5_2': f.f_5_2,
      'f_5_3': f.f_5_3,
      'f_5_4': f.f_5_4,
      'f_5_5': f.f_5_5,
      'f_5_6': f.f_5_6,
      'f_5_7': f.f_5_7,
      'f_5_8': f.f_5_8,
      'f_5_9': f.f_5_9,
      'f_4_1': f.f_4_1,
      'f_4_2': f.f_4_2,
      'f_4_3': f.f_4_3,
      'f_4_4': f.f_4_4,
      'f_4_5': f.f_4_5,
      'f_4_6': f.f_4_6,
      'f_4_7': f.f_4_7,
      'f_3_1': f.f_3_1,
      'f_3_2': f.f_3_2,
      'f_3_3': f.f_3_3,
      'f_3_4': f.f_3_4,
      'f_3_5': f.f_3_5,
    };
  }

  List<String> getFormatList(BuildContext context) {
    final f = Localization.of(context).formats;
    return [
      f.title,
      f.repeat_2,
      f.repeat_3,
      f.repeat_4,
      f.f_5_1,
      f.f_5_2,
      f.f_5_3,
      f.f_5_4,
      f.f_5_5,
      f.f_5_6,
      f.f_5_7,
      f.f_5_8,
      f.f_5_9,
      f.f_4_1,
      f.f_4_2,
      f.f_4_3,
      f.f_4_4,
      f.f_4_5,
      f.f_4_6,
      f.f_4_7,
      f.f_3_1,
      f.f_3_2,
      f.f_3_3,
      f.f_3_4,
      f.f_3_5,
    ];
  }

  bool matchesFormat(String number, String formatKey) {
    if (number.isEmpty) return false;
    final digits = number.split('');
    final len = digits.length;

    bool allEqual(List<int> idx) => idx.map((i) => digits[i]).toSet().length == 1;
    bool allDistinct(List<int> idx) => idx.map((i) => digits[i]).toSet().length == idx.length;
    bool repeatCount(int count) => digits.toSet().any((d) => digits.where((x) => x == d).length == count);

    switch (formatKey) {
      // Repetition checks
      case 'repeat_2':
        return repeatCount(2);
      case 'repeat_3':
        return repeatCount(3);
      case 'repeat_4':
        return repeatCount(4);

      // 5-digit patterns
      case 'f_5_1': // X???X
        return len == 5 && digits[0] == digits[4];
      case 'f_5_2': // XYZYX
        return len == 5 && digits[0] == digits[4] && digits[1] == digits[3] && allDistinct([0, 1, 2]);
      case 'f_5_3': // XXXZX
        return len == 5 &&
            digits[0] == digits[1] &&
            digits[1] == digits[2] &&
            digits[0] == digits[4] &&
            digits[3] != digits[0];
      case 'f_5_4': // ?XXX?
        return len == 5 && digits[1] == digits[2] && digits[2] == digits[3];
      case 'f_5_5': // XYXYX
        return len == 5 &&
            digits[0] == digits[2] &&
            digits[2] == digits[4] &&
            digits[1] == digits[3] &&
            digits[0] != digits[1];
      case 'f_5_6': // XYYYX
        return len == 5 &&
            digits[0] == digits[4] &&
            digits[1] == digits[2] &&
            digits[2] == digits[3] &&
            digits[0] != digits[1];
      case 'f_5_7': // ??XXX
        return len == 5 && digits[2] == digits[3] && digits[3] == digits[4];
      case 'f_5_8': // XXX??
        return len == 5 && digits[0] == digits[1] && digits[1] == digits[2];
      case 'f_5_9': // XXXXX
        return len == 5 && allEqual([0, 1, 2, 3, 4]);

      // 4-digit patterns
      case 'f_4_1': // X??X
        return len == 4 && digits[0] == digits[3];
      case 'f_4_2': // XYXX
        return len == 4 && digits[0] == digits[2] && digits[2] == digits[3] && digits[0] != digits[1];
      case 'f_4_3': // XYXY
        return len == 4 && digits[0] == digits[2] && digits[1] == digits[3] && digits[0] != digits[1];
      case 'f_4_4': // ?XX?
        return len == 4 && digits[1] == digits[2];
      case 'f_4_5': // XXXY
        return len == 4 && digits[0] == digits[1] && digits[1] == digits[2] && digits[2] != digits[3];
      case 'f_4_6': // XYYY
        return len == 4 && digits[1] == digits[2] && digits[2] == digits[3] && digits[0] != digits[1];
      case 'f_4_7': // XXXX
        return len == 4 && allEqual([0, 1, 2, 3]);

      // 3-digit patterns
      case 'f_3_1': // XYX
        return len == 3 && digits[0] == digits[2] && digits[0] != digits[1];
      case 'f_3_2': // XYZ
        return len == 3 && allDistinct([0, 1, 2]);
      case 'f_3_3': // XYY
        return len == 3 && digits[1] == digits[2] && digits[0] != digits[1];
      case 'f_3_4': // XXY
        return len == 3 && digits[0] == digits[1] && digits[1] != digits[2];
      case 'f_3_5': // XXX
        return len == 3 && allEqual([0, 1, 2]);

      default:
        return false;
    }
  }

  bool _matches(PlateListing plate) {
    final m = Localization.of(context);
    final isArabic = m.languageCode == 'ar';
    final number = plate.item.number;
    final digitLabel = (isArabic ? _digitCountsAR : _digitCountsEN)[plate.item.number.length - 1];

    if (_selectedCode != null && _selectedCode!.isNotEmpty && _selectedCode != m.plates.code) {
      if (plate.item.code != _selectedCode) return false;
    }

    if (_selectedDigits != null && _selectedDigits!.isNotEmpty && _selectedDigits != m.plates.digit_count) {
      if (digitLabel != _selectedDigits) return false;
    }

    if (_selectedFormat != null && _selectedFormat!.isNotEmpty) {
      return matchesFormat(plate.item.number, _selectedFormat!);
    }

    if (_containsController.text.isNotEmpty && !number.contains(_containsController.text)) {
      return false;
    }

    if (_startsWithController.text.isNotEmpty && !number.startsWith(_startsWithController.text)) {
      return false;
    }

    if (_endsWithController.text.isNotEmpty && !number.endsWith(_endsWithController.text)) {
      return false;
    }

    final min = int.tryParse(_minPriceController.text);
    final max = int.tryParse(_maxPriceController.text);

    if (min != null && !plate.priceHidden && plate.price < min) return false;
    if (max != null && !plate.priceHidden && plate.price > max) return false;

    return !plate.isDisabled && !plate.isExpired;
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
    final m = Localization.of(context);
    final visiblePlates = _allPlates.where(_matches).toList();
    final isArabic = m.languageCode == 'ar';
    final digitOptions = isArabic ? _digitCountsAR : _digitCountsEN;
    final formatMap = getFormatMap(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(m.plates.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30,
            onPressed: () {
              if (FirebaseAuth.instance.currentUser == null) {
                context.router.push(const AuthRoute());
              } else {
                context.router.push(const AddPlateNumberRoute());
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: inputFieldStyle.copyWith(labelText: m.plates.code),
                    value: _selectedCode,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: [m.plates.code, ..._codes].map((c) {
                      return DropdownMenuItem(
                        value: c,
                        child: Text(c, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() {
                      if (val == m.plates.code) {
                        val = null;
                      }
                      _selectedCode = val;
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: inputFieldStyle.copyWith(labelText: m.plates.digit_count),
                    value: _selectedDigits,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    items: [m.plates.digit_count, ...digitOptions].map((d) {
                      return DropdownMenuItem(
                        value: d,
                        child: Text(d, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() {
                      if (val == m.plates.digit_count) {
                        val = null;
                      } else {
                        _selectedDigits = val;
                      }
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: inputFieldStyle.copyWith(labelText: m.plates.format),
              value: _selectedFormat,
              icon: const Icon(
                Icons.arrow_drop_down,
              ),
              items: [
                DropdownMenuItem(value: null, child: Text(m.plates.format)),
                ...formatMap.entries.map((e) => DropdownMenuItem(
                      value: e.key,
                      child: Text(e.value, style: const TextStyle(fontSize: 14)),
                    )),
              ],
              onChanged: (val) => setState(() => _selectedFormat = val),
            ),
            const SizedBox(height: 8),
            if (_isExpanded) ...[
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          controller: _containsController,
                          decoration: inputFieldStyle.copyWith(labelText: m.plates.contains))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: TextFormField(
                          controller: _startsWithController,
                          decoration: inputFieldStyle.copyWith(labelText: m.plates.starts_with))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: TextFormField(
                          controller: _endsWithController,
                          decoration: inputFieldStyle.copyWith(labelText: m.plates.ends_with))),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          controller: _minPriceController,
                          keyboardType: TextInputType.number,
                          decoration: inputFieldStyle.copyWith(labelText: m.plates.min_price))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: TextFormField(
                          controller: _maxPriceController,
                          keyboardType: TextInputType.number,
                          decoration: inputFieldStyle.copyWith(labelText: m.plates.max_price))),
                ],
              ),
            ],
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Row(
                children: [
                  Text(_isExpanded ? m.plates.show_less : m.plates.see_more,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            PlatesListingsGrid(itemList: visiblePlates),
          ],
        ),
      ),
    );
  }
}
