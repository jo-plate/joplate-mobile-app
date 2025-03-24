import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

@RoutePage()
class EditFullNamePage extends StatefulWidget {
  const EditFullNamePage({super.key});

  @override
  State<EditFullNamePage> createState() => _EditFullNamePageState();
}

class _EditFullNamePageState extends State<EditFullNamePage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: FirebaseAuth.instance.currentUser?.displayName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(m.editProfile.edit_fullname),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: m.editProfile.Full_Name),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () async {
                await FirebaseAuth.instance.currentUser?.updateDisplayName(_nameController.text);
                await FirebaseFirestore.instance
                    .collection(userProfileCollectionId)
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .set({'name': _nameController.text}, SetOptions(merge: true));
                if (context.mounted) Navigator.of(context).pop();
              },
              child: Text(m.editProfile.save),
            ),
          ],
        ),
      ),
    );
  }
}
