// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// @RoutePage()
// class EditFullNamePage extends StatefulWidget {
//   final String currentName;

//   const EditFullNamePage({super.key, required this.currentName});

//   @override
//   State<EditFullNamePage> createState() => _EditFullNamePageState();
// }

// class _EditFullNamePageState extends State<EditFullNamePage> {
//   late TextEditingController _nameController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.currentName);
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     super.dispose();
//   }

//   void _saveName() {
//     // Implement the logic to save the name to the backend or state
//     Navigator.pop(context, _nameController.text); // Returning new name
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Full Name'),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Full Name'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveName,
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
