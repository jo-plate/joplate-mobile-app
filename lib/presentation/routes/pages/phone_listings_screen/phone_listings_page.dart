import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phones_listing_grid.dart';

@RoutePage()
class PhoneListingsPage extends StatefulWidget {
  const PhoneListingsPage({super.key});

  @override
  State<PhoneListingsPage> createState() => _PhoneListingsPageState();
}

class _PhoneListingsPageState extends State<PhoneListingsPage> {
  PhoneOperator _operator = PhoneOperator.none;
  bool _showAdvanced = false;

  final _containsCtrl = TextEditingController();
  final _startsWithCtrl = TextEditingController();
  final _endsWithCtrl = TextEditingController();
  final _minPriceCtrl = TextEditingController();
  final _maxPriceCtrl = TextEditingController();

  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>> _sub;
  List<PhoneListing> _allPhones = [];

  @override
  void initState() {
    super.initState();

    _sub = FirebaseFirestore.instance
        .collection(phoneNumbersCollectionId)
        .where('isDisabled', isEqualTo: false)
        .where('expiresAt', isGreaterThan: DateTime.now())
        .orderBy('isSold', descending: false)
        .orderBy('featuredUntil', descending: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snap) {
      setState(() {
        _allPhones = snap.docs.map((d) => PhoneListing.fromSnapshot(d)).toList();
      });
    });

    for (final c in [_containsCtrl, _startsWithCtrl, _endsWithCtrl, _minPriceCtrl, _maxPriceCtrl]) {
      c.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _sub.cancel();
    _containsCtrl.dispose();
    _startsWithCtrl.dispose();
    _endsWithCtrl.dispose();
    _minPriceCtrl.dispose();
    _maxPriceCtrl.dispose();
    super.dispose();
  }

  bool _matches(PhoneListing phone) {
    final number = phone.item.number;

    if (_operator != PhoneOperator.none && phone.item.phoneOperator != _operator) {
      return false;
    }

    if (_containsCtrl.text.isNotEmpty && !number.contains(_containsCtrl.text)) {
      return false;
    }
    if (_startsWithCtrl.text.isNotEmpty && !number.startsWith(_startsWithCtrl.text)) {
      return false;
    }
    if (_endsWithCtrl.text.isNotEmpty && !number.endsWith(_endsWithCtrl.text)) {
      return false;
    }

    final min = double.tryParse(_minPriceCtrl.text);
    final max = double.tryParse(_maxPriceCtrl.text);

    if (min != null && !phone.priceHidden && phone.price < min) return false;
    if (max != null && !phone.priceHidden && phone.price > max) return false;

    return true;
  }

  InputDecoration get inputFieldStyle {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InputDecoration(
      labelStyle: TextStyle(
        color: isDark ? Colors.white70 : Colors.grey,
        fontSize: 14,
      ),
      hintStyle: TextStyle(
        color: isDark ? Colors.white70 : Colors.grey.shade500,
        fontSize: 14,
      ),
      border: theme.inputDecorationTheme.border,
      enabledBorder: theme.inputDecorationTheme.enabledBorder,
      focusedBorder: theme.inputDecorationTheme.focusedBorder,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      filled: true,
      fillColor: isDark ? theme.colorScheme.surface : Colors.grey.shade50,
    );
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final visiblePhones = _allPhones.where(_matches).toList();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text(m.phones.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 30),
            onPressed: () => {
              if (FirebaseAuth.instance.currentUser == null)
                {context.router.push(const AuthRoute())}
              else
                {context.router.push(const AddPhoneNumberRoute())}
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
                  child: DropdownButtonFormField<PhoneOperator>(
                    decoration: inputFieldStyle.copyWith(labelText: m.phones.company_label),
                    value: _operator,
                    icon: Icon(Icons.arrow_drop_down, color: primaryColor),
                    style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                    dropdownColor: isDark ? theme.colorScheme.surface : Colors.grey.shade50,
                    items: PhoneOperator.values
                        .map((op) => DropdownMenuItem(
                              value: op,
                              child: Text(op.name, style: const TextStyle(fontSize: 14)),
                            ))
                        .toList(),
                    onChanged: (val) => setState(() => _operator = val!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (_showAdvanced) ...[
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _containsCtrl,
                      style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                      decoration: inputFieldStyle.copyWith(labelText: m.phones.contains),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _startsWithCtrl,
                      style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                      decoration: inputFieldStyle.copyWith(labelText: m.phones.starts_with),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _endsWithCtrl,
                      style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                      decoration: inputFieldStyle.copyWith(labelText: m.phones.ends_with),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _minPriceCtrl,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                      decoration: inputFieldStyle.copyWith(labelText: m.phones.min_price),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _maxPriceCtrl,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                      decoration: inputFieldStyle.copyWith(labelText: m.phones.max_price),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => setState(() => _showAdvanced = !_showAdvanced),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _showAdvanced ? m.phones.show_less : m.phones.see_more,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    _showAdvanced ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Divider(height: 1, thickness: 1, color: isDark ? theme.dividerTheme.color : const Color(0xFFEEEEEE)),
            const SizedBox(height: 16),
            PhonesListingGrid(itemList: visiblePhones),
          ],
        ),
      ),
    );
  }
}
