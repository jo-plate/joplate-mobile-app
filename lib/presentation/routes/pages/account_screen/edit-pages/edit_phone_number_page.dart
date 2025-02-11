// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// @RoutePage()
// class EditPhoneNumberPage extends StatefulWidget {
//   final String currentPhone;

//   const EditPhoneNumberPage({super.key, required this.currentPhone});

//   @override
//   State<EditPhoneNumberPage> createState() => _EditPhoneNumberPageState();
// }

// class _EditPhoneNumberPageState extends State<EditPhoneNumberPage> {
//   late TextEditingController _phoneController;

//   @override
//   void initState() {
//     super.initState();
//     _phoneController = TextEditingController(text: widget.currentPhone);
//   }

//   @override
//   void dispose() {
//     _phoneController.dispose();
//     super.dispose();
//   }

//   void _savePhoneNumber() {
//     Navigator.pop(context, _phoneController.text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Edit Phone Number')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _phoneController,
//               decoration: const InputDecoration(labelText: 'Phone Number'),
//               keyboardType: TextInputType.phone,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _savePhoneNumber,
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
