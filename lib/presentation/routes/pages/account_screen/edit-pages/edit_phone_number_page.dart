import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/phone_number_input.dart';

@RoutePage()
class EditPhoneNumberPage extends StatefulWidget {
  const EditPhoneNumberPage({super.key});

  @override
  State<EditPhoneNumberPage> createState() => _EditPhoneNumberPageState();
}

class _EditPhoneNumberPageState extends State<EditPhoneNumberPage> {
  late TextEditingController _phoneController;
  bool _isLoading = true;
  bool _isSaving = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _loadPhoneNumber();
  }

  Future<void> _loadPhoneNumber() async {
    final user = FirebaseAuth.instance.currentUser;

    try {
      final doc = await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(user?.uid).get();

      if (doc.exists) {
        String phoneNumber = doc.data()?['phonenumber'] ?? '';

        // Convert number format if it has 0 prefix
        if (phoneNumber.startsWith('0')) {
          phoneNumber = phoneNumber.substring(1);
        }
        
        setState(() {
          _phoneController.text = phoneNumber;
          _isLoading = false;
        });
      } else {
        // create doc
        await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(user?.uid).set({'phonenumber': ''});
        setState(() {
          _phoneController.text = '';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<bool> _isPhoneNumberUnique(String phoneNumber) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    // Query to find any user with the same phone number
    final querySnapshot = await FirebaseFirestore.instance
        .collection(userProfileCollectionId)
        .where('phonenumber', isEqualTo: phoneNumber)
        .get();

    // If no documents found, or if the only document found is the current user's
    return querySnapshot.docs.isEmpty || (querySnapshot.docs.length == 1 && querySnapshot.docs.first.id == user.uid);
  }

  Future<void> _savePhoneNumber() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final phoneNumber = _phoneController.text.trim();

    // Check if phone number is unique
    final isUnique = await _isPhoneNumberUnique(phoneNumber);
    if (!isUnique) {
      if (context.mounted) {
        final m = Localization.of(context);
        AppSnackbar.showError(m.editprofile.phone_number_already_used);
      }
      return;
    }

    setState(() => _isSaving = true);
    try {
      await FirebaseFirestore.instance
          .collection(userProfileCollectionId)
          .doc(user.uid)
          .set({'phonenumber': '+962$phoneNumber'}, SetOptions(merge: true));
      if (context.mounted) Navigator.pop(context, phoneNumber);
    } catch (e) {
      if (context.mounted) {
        AppSnackbar.showError('Failed to save phone number. Please try again.');
      }
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(m.editprofile.edit_phone)),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    PhoneNumberInput(
                      controller: _phoneController,
                      labelText: m.editprofile.phone_number,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      hintText: '7X XXX XXXX',
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: _isSaving ? null : _savePhoneNumber,
                      child: _isSaving
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                color: Colors.white,
                              ),
                            )
                          : Text(m.editprofile.save),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
