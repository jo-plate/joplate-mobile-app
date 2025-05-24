import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/utils/user_plan_theme.dart';
import 'package:joplate/presentation/widgets/profile_picture_widget.dart';
import 'package:joplate/presentation/widgets/user_plan_badge.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OtherSellersTable extends StatefulWidget {
  final String userId;
  final PlateNumber plateNumber;

  const OtherSellersTable({
    super.key,
    required this.userId,
    required this.plateNumber,
  });

  @override
  State<OtherSellersTable> createState() => _OtherSellersTableState();
}

class _OtherSellersTableState extends State<OtherSellersTable> {
  Future<List<Map<String, dynamic>>> _fetchOtherSellers() async {
    final listingsSnapshot = await FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('item.code', isEqualTo: widget.plateNumber.code)
        .where('item.number', isEqualTo: widget.plateNumber.number)
        .where('isDisabled', isEqualTo: false)
        .where('isSold', isEqualTo: false)
        .where('expiresAt', isGreaterThan: Timestamp.now())
        .where('userId', isNotEqualTo: widget.userId)
        .get();

    final otherListings = listingsSnapshot.docs.map((doc) {
      return PlateListing.fromSnapshot(doc);
    }).toList();

    final userIds = otherListings.map((l) => l.userId).toSet().toList();

    // Fetch user profiles
    final userDocs = await Future.wait(
      userIds.map((id) => FirebaseFirestore.instance.collection(userProfileCollectionId).doc(id).get()),
    );

    // Fetch user plans
    final planDocs = await Future.wait(
      userIds.map((id) => FirebaseFirestore.instance.collection(userPlansCollectionId).doc(id).get()),
    );

    final profiles = userDocs.where((doc) => doc.exists).map((doc) => UserProfile.fromSnapshot(doc)).toList();
    final plans = planDocs.map((doc) => doc.exists ? UserPlans.fromJson(doc.data()!) : UserPlans.freePlan()).toList();

    return List.generate(otherListings.length, (i) {
      final profile = profiles[i];
      final listing = otherListings[i];
      final plan = plans[i];

      return {
        "id": profile.id,
        "displayName": profile.displayName,
        "phone": profile.phonenumber,
        "isVerified": profile.isVerified,
        "listingId": listing.id,
        "plan": plan.plan,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchOtherSellers(),
      builder: (context, snapshot) {
        if (snapshot.data == null || (snapshot.data?.isEmpty ?? true)) {
          return const SizedBox();
        }

        final sellers = snapshot.data!;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2D334D) : Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF981C1E) : const Color(0xFF981C1E).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.people_outline,
                          color: isDark ? Colors.white70 : const Color(0xFF981C1E), size: 20),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      m.platesdetails.other_sellers,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(1),
                },
                children: [
                  _buildTableHeader(context),
                  ...sellers.map((s) => _buildSellerRow(
                        userId: s['id'],
                        name: s['displayName'],
                        phoneNumber: s['phone'],
                        isVerified: s['isVerified'],
                        listingId: s['listingId'],
                        plan: s['plan'],
                      )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  TableRow _buildTableHeader(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TableRow(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: isDark ? const Color(0xFF3D4266) : const Color(0xFFE0E0E0), width: 1)),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _headerText(m.platesdetails.seller, isDark),
        ),
        _headerText(m.platesdetails.contact, isDark),
      ],
    );
  }

  Widget _headerText(String text, bool isDark) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white70 : const Color(0xFF7F8C8D),
            fontSize: 13,
          ),
        ),
      );

  TableRow _buildSellerRow({
    required String userId,
    required String name,
    required String phoneNumber,
    required bool isVerified,
    required String listingId,
    required PlanType plan,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = UserPlanTheme.getAccentColor(plan, isDarkMode: isDark);
    final textColor = UserPlanTheme.getTextColor(plan, isDarkMode: isDark);
    final backgroundColor = UserPlanTheme.getBackgroundColor(plan, isDarkMode: isDark);

    // For diamond plan, always ensure icon colors have good contrast
    final iconColor =
        plan == PlanType.diamond_plan ? Colors.white : UserPlanTheme.getIconColor(plan, isDarkMode: isDark);

    void goToDetails() => AutoRouter.of(context).push(PlatesDetailsRoute(listingId: listingId));

    Widget wrap(Widget child) => Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: goToDetails,
            child: child,
          ),
        );

    final planBgOpacity = isDark ? 0.4 : 0.2;

    return TableRow(
      decoration: BoxDecoration(
        color: plan != PlanType.free_plan ? backgroundColor.withOpacity(planBgOpacity) : null,
        border: Border(bottom: BorderSide(color: isDark ? const Color(0xFF3D4266) : const Color(0xFFF5F5F5), width: 1)),
      ),
      children: [
        wrap(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
            child: Row(
              children: [
                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance.collection(userProfileCollectionId).doc(userId).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.exists) {
                      final userProfile = UserProfile.fromSnapshot(snapshot.data!);
                      if (userProfile.imageUrl.isEmpty) {
                        return Icon(Icons.people_outline,
                            color: isDark ? Colors.white70 : const Color(0xFF981C1E), size: 20);
                      }
                      return ProfilePictureWidget(
                        imageUrl: userProfile.imageUrl,
                        size: 32,
                        showUploadButton: false,
                      );
                    }
                    return CircleAvatar(
                      radius: 16,
                      backgroundColor: accentColor.withOpacity(0.1),
                      child: Icon(
                        Icons.person_outline,
                        size: 18,
                        color: iconColor,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (isVerified) ...[
                        const SizedBox(width: 4),
                        Icon(
                          Icons.verified,
                          color: Colors.blue.shade600,
                          size: 14,
                        ),
                      ],
                      const SizedBox(width: 6),
                      UserPlanBadge(plan: plan),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        wrap(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _iconButton(
                  color: Colors.green,
                  icon: FontAwesomeIcons.whatsapp,
                  onPressed: () => launchUrlString("https://wa.me/962${phoneNumber.substring(1)}"),
                ),
                const SizedBox(width: 8),
                _iconButton(
                  color: const Color(0xFF981C1E),
                  icon: Icons.phone,
                  onPressed: () async {
                    final uri = 'tel:+962${phoneNumber.substring(1)}';
                    if (await canLaunchUrlString(uri)) {
                      await launchUrlString(uri);
                    } else {
                      throw 'Could not launch dialer';
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _iconButton({required Color color, required IconData icon, required VoidCallback onPressed}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Adjust color for red buttons in dark mode
    final buttonColor = isDark && color == const Color(0xFF981C1E) ? Colors.white70 : color;

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(color: buttonColor.withOpacity(0.1), shape: BoxShape.circle),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 16, color: buttonColor),
        onPressed: onPressed,
      ),
    );
  }
}
