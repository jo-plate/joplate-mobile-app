import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

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
        setState(() {
          _phoneController.text = doc.data()?['phonenumber'] ?? '';
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

  Future<void> _savePhoneNumber() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    setState(() => _isSaving = true);
    try {
      await FirebaseFirestore.instance
          .collection(userProfileCollectionId)
          .doc(user.uid)
          .set({'phonenumber': _phoneController.text}, SetOptions(merge: true));
      if (context.mounted) Navigator.pop(context, _phoneController.text);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save phone number. Please try again.')),
        );
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
      appBar: AppBar(title: Text(m.editProfile.edit_phone)),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: m.editProfile.phone_number),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: _isSaving ? null : _savePhoneNumber,
                    child: _isSaving ? const CircularProgressIndicator() : Text(m.editProfile.save),
                  ),
                ],
              ),
            ),
    );
  }
}
