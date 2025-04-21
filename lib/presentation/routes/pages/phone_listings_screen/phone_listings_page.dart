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
        .orderBy('featuredUntil', descending: true)
        .orderBy('isSold', descending: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snap) {
      setState(() {
        _allPhones =
            snap.docs.map((d) => PhoneListing.fromSnapshot(d)).toList();
      });
    });

    for (final c in [
      _containsCtrl,
      _startsWithCtrl,
      _endsWithCtrl,
      _minPriceCtrl,
      _maxPriceCtrl
    ]) {
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

    if (_operator != PhoneOperator.none &&
        phone.item.phoneOperator != _operator) {
      return false;
    }

    if (_containsCtrl.text.isNotEmpty && !number.contains(_containsCtrl.text)) {
      return false;
    }
    if (_startsWithCtrl.text.isNotEmpty &&
        !number.startsWith(_startsWithCtrl.text)) {
      return false;
    }
    if (_endsWithCtrl.text.isNotEmpty && !number.endsWith(_endsWithCtrl.text)) {
      return false;
    }

    final isValid = !phone.isDisabled && !phone.isSold && !phone.isExpired;
    if (!isValid) return false;

    final min = double.tryParse(_minPriceCtrl.text);
    final max = double.tryParse(_maxPriceCtrl.text);

    if (min != null && !phone.priceHidden && phone.price < min) return false;
    if (max != null && !phone.priceHidden && phone.price > max) return false;

    return true;
  }

  InputDecoration get _inputDecoration => InputDecoration(
        labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      );

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final visiblePhones = _allPhones.where(_matches).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(m.phones.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 30, color: Color(0xFF981C1E)),
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
                    decoration: _inputDecoration.copyWith(
                        labelText: m.phones.company_label),
                    value: _operator,
                    icon: const Icon(Icons.arrow_drop_down,
                        color: Color(0xFF981C1E)),
                    items: PhoneOperator.values
                        .map((op) => DropdownMenuItem(
                              value: op,
                              child: Text(op.name,
                                  style: const TextStyle(fontSize: 14)),
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
                    child: TextField(
                      controller: _containsCtrl,
                      decoration: _inputDecoration.copyWith(
                          labelText: m.phones.contains),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _startsWithCtrl,
                      decoration: _inputDecoration.copyWith(
                          labelText: m.phones.starts_with),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _endsWithCtrl,
                      decoration: _inputDecoration.copyWith(
                          labelText: m.phones.ends_with),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _minPriceCtrl,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration.copyWith(
                          labelText: m.phones.min_price),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _maxPriceCtrl,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration.copyWith(
                          labelText: m.phones.max_price),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
            GestureDetector(
              onTap: () => setState(() => _showAdvanced = !_showAdvanced),
              child: Row(
                children: [
                  Text(
                    _showAdvanced ? m.phones.show_less : m.phones.see_more,
                    style: const TextStyle(
                        color: Color(0xFF981C1E), fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    _showAdvanced
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: const Color(0xFF981C1E),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            PhonesListingGrid(itemList: visiblePhones),
          ],
        ),
      ),
    );
  }
}
