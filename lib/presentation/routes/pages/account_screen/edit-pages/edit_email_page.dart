// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// @RoutePage()
// class EditEmailPage extends StatefulWidget {
//   final String currentEmail;

//   const EditEmailPage({super.key, required this.currentEmail});

//   @override
//   State<EditEmailPage> createState() => _EditEmailPageState();
// }

// class _EditEmailPageState extends State<EditEmailPage> {
//   late TextEditingController _emailController;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController(text: widget.currentEmail);
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   void _saveEmail() {
//     String newEmail = _emailController.text.trim();

//     if (newEmail.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(newEmail)) {
//       // Show an error message if email is invalid
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter a valid email address")),
//       );
//       return;
//     }

//     // Implement email update logic
//     Navigator.pop(context, newEmail); // Returning new email
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Email'),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(labelText: 'Email Address'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveEmail,
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
