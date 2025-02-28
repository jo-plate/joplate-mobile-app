import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';

class ProfileBanner extends StatefulWidget {
  const ProfileBanner({super.key, this.clickable = true});

  final bool clickable;

  @override
  State<ProfileBanner> createState() => _ProfileBannerState();
}

class _ProfileBannerState extends State<ProfileBanner> {
  late final Stream<User?> userStream;

  @override
  void initState() {
    super.initState();
    userStream = FirebaseAuth.instance.userChanges();
  }

  @override
  void dispose() {
    userStream.drain();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: userStream,
        builder: (context, snapshot) {
          final profile = snapshot.data;
          return GestureDetector(
            onTap: () {
              if (widget.clickable) {
                AutoRouter.of(context).push(const AccountRoute());
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 214, 214), // Light beige background
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color.fromARGB(255, 180, 37, 27), width: 1), // Brown border
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Profile Image + Membership Tag
                  Column(
                    children: [
                      Container(
                        width: 68, // Match CircleAvatar size
                        height: 68,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // Background color
                          image: DecorationImage(
                            image: AssetImage('assets/images/avatar3.jpg'),
                            fit: BoxFit.contain, // Ensures full image fits inside the circle
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 153, 31, 22),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Basic',
                          style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 14),

                  // User Info & Icons
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile?.displayName ?? 'Guest',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),

                        // Currency Info Row with Images
                        const Row(
                          children: [
                            Row(
                              children: [
                                PlanIcon(size: 26, color: Colors.white, borderColor: Colors.black), // Custom icon
                                SizedBox(width: 6),
                                Text("3",
                                    style:
                                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)), // Slightly larger text
                              ],
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.add_circle_outline, size: 20, color: Color(0xFF981C1E)), // Bigger plus icon
                            SizedBox(width: 12),
                            Row(
                              children: [
                                PlanIcon(size: 30, color: Color(0xFFD4AF37), borderColor: Colors.black), // Custom icon
                                SizedBox(width: 6),
                                Text("3",
                                    style:
                                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)), // Slightly larger text
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Arrow Icon
                  const Icon(Icons.arrow_forward_ios, size: 22, color: Colors.brown), // Increased arrow size
                ],
              ),
            ),
          );
        });
  }
}
