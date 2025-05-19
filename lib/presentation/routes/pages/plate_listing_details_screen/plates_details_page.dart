import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/utils/strings.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_listing_widget.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/promote_listing_button.dart';
import 'package:joplate/presentation/widgets/delete_item_popup.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';
import 'package:joplate/presentation/widgets/profile_picture_widget.dart';
import 'package:joplate/presentation/widgets/user_plan_badge.dart';
import 'package:joplate/utils/log_visit.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:joplate/presentation/utils/user_plan_theme.dart';

@RoutePage()
class PlatesDetailsPage extends StatefulWidget {
  const PlatesDetailsPage({super.key, @PathParam('listingId') required this.listingId});

  final String listingId;

  @override
  State<PlatesDetailsPage> createState() => _PlatesDetailsPageState();
}

class _PlatesDetailsPageState extends State<PlatesDetailsPage> {
  late final Stream<PlateListing> _plateStream;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _plateStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .doc(widget.listingId)
        .snapshots()
        .map((snapshot) => PlateListing.fromSnapshot(snapshot));

    _timer = Timer(const Duration(seconds: logVisitTimer), () {
      logVisit(
        listingId: widget.listingId,
        listingType: ListingType.ad,
        itemType: ItemType.plateNumber,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return StreamBuilder<PlateListing>(
        stream: _plateStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24, top: MediaQuery.of(context).size.height / 4),
              child: Text(
                'Error getting data for Listing',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
              appBar: AppBar(
                title: Text(m.platesdetails.title),
                actions: [
                  FavoriteButton.plate(listingId: widget.listingId),
                  const SizedBox(
                    width: 16,
                  ),
                  if (FirebaseAuth.instance.currentUser?.uid == snapshot.data!.userId) ...[
                    GestureDetector(
                      child: const Icon(Icons.edit_outlined),
                      onTap: () {
                        AutoRouter.of(context).push(EditPlateListingRoute(listing: snapshot.data!));
                      },
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      child: const Icon(Icons.delete_outline),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => DeleteListingDialog(
                            listingId: widget.listingId,
                            itemType: ItemType.plateNumber, // or ItemType.phoneNumber, etc.
                            listingType: ListingType.ad, // or ListingType.request
                            plateNumber: snapshot.data!.item,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ]
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PlateNumberListingWidget(
                      disabled: true,
                      item: snapshot.data!,
                      hideLikeButton: true,
                      priceLabelFontSize: 24,
                    ),
                    if (snapshot.data!.userId == FirebaseAuth.instance.currentUser?.uid &&
                        snapshot.data!.expiresAt != null &&
                        !snapshot.data!.isDisabled &&
                        !snapshot.data!.isSold) ...[
                      const SizedBox(
                        height: 8,
                      ),
                      if (snapshot.data!.isExpired)
                        Text(
                          m.home.expired,
                          style: const TextStyle(fontSize: 14, color: Colors.red),
                        )
                      else
                        Text(
                          m.listingdetails.expires_on(snapshot.data!.expiresAt!.toLocal()),
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                    ],
                    if (!(snapshot.data?.isFeatured ?? false) &&
                        (FirebaseAuth.instance.currentUser?.uid ?? '') == snapshot.data!.userId &&
                        !snapshot.data!.isSold) ...[
                      const SizedBox(height: 8),
                      PromoteListingButton(listingId: snapshot.data!.id, itemType: ItemType.plateNumber),
                    ],
                    const SizedBox(height: 16),
                    SellerDetails(userId: snapshot.data!.userId, visits: snapshot.data!.visits),
                    const SizedBox(height: 16),
                    OtherSellersTable(
                      userId: snapshot.data!.userId,
                      plateNumber: snapshot.data!.item,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            m.platesdetails.important_note,
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.payments, color: isDark ? Colors.white70 : const Color(0xFF981C1E)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  m.platesdetails.dont_transfer_money,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: isDark ? Colors.white70 : const Color(0xFF981C1E)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  m.platesdetails.meet_in_person,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ));
        });
  }
}

class SellerDetails extends StatefulWidget {
  const SellerDetails({super.key, required this.userId, required this.visits});
  final String userId;
  final int visits;

  @override
  State<SellerDetails> createState() => _SellerDetailsState();
}

class _SellerDetailsState extends State<SellerDetails> {
  late final Stream<UserProfile> userProfileStream;
  late final Stream<UserPlans> userPlansStream;

  @override
  void initState() {
    super.initState();
    userProfileStream =
        FirebaseFirestore.instance.collection(userProfileCollectionId).doc(widget.userId).snapshots().map((snapshot) {
      return UserProfile.fromJson(snapshot.data() ?? {});
    });

    userPlansStream = FirebaseFirestore.instance
        .collection(userPlansCollectionId)
        .doc(widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.exists ? UserPlans.fromJson(snapshot.data()!) : UserPlans.freePlan());
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return StreamBuilder<UserPlans>(
      stream: userPlansStream,
      builder: (context, plansSnapshot) {
        final plan = plansSnapshot.data?.plan ?? PlanType.free_plan;

        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: UserPlanTheme.getSellerContainerStyle(context, plan),
          child: StreamBuilder<UserProfile>(
              stream: userProfileStream,
              builder: (context, snapshot) {
                final userProfile = snapshot.data;
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (userProfile == null) {
                  return const Text('User not found');
                }

                final textColor = UserPlanTheme.getTextColor(plan, isDarkMode: isDark);
                final accentColor = UserPlanTheme.getAccentColor(plan, isDarkMode: isDark);
                final iconColor = UserPlanTheme.getIconColor(plan, isDarkMode: isDark);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.userId == FirebaseAuth.instance.currentUser?.uid) ...[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: '${m.home.visits}: '),
                            TextSpan(text: widget.visits.toString()),
                          ],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.person_outline,
                            color: iconColor,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          m.platesdetails.originally_posted_by,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        // Navigate to user profile
                        AutoRouter.of(context).push(UserProfileRoute(userId: widget.userId));
                      },
                      child: Row(
                        children: [
                          ProfilePictureWidget(
                            imageUrl: userProfile.imageUrl,
                            size: 48,
                            showUploadButton: false,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(userProfile.displayName,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: textColor,
                                        )),
                                    const SizedBox(width: 6),
                                    if (userProfile.isVerified)
                                      Icon(
                                        Icons.verified,
                                        color: Colors.blue.shade600,
                                        size: 20,
                                      ),
                                    const SizedBox(width: 8),
                                    UserPlanBadge(plan: plan),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: textColor.withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(isDark ? 0.1 : 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                onTap: () {
                                  launchUrlString("https://wa.me/962${userProfile.phonenumber.substring(1)}",
                                      mode: LaunchMode.externalApplication);
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.whatsapp,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'WhatsApp',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF981C1E),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  final uri = 'tel:+962${userProfile.phonenumber.substring(1)}';
                                  if (await canLaunchUrlString(uri)) {
                                    await launchUrlString(uri);
                                  } else {
                                    throw 'Could not launch dialer';
                                  }
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      obfuscatePhoneNumber(userProfile.phonenumber),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}

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
        .where('expiresAt', isGreaterThan: DateTime.now())
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
        "name": profile.displayName,
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
                        color: isDark ? Colors.white70 : const Color(0xFF981C1E).withOpacity(0.1),
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
                        name: s['name'],
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
                  stream: FirebaseFirestore.instance.collection(userProfileCollectionId).doc(phoneNumber).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.exists) {
                      final userProfile = UserProfile.fromSnapshot(snapshot.data!);
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
