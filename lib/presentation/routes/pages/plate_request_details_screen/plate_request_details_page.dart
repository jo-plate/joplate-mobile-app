import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/utils/strings.dart';
import 'package:joplate/presentation/utils/user_plan_theme.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_request_widget.dart';
import 'package:joplate/presentation/widgets/delete_item_popup.dart';
import 'package:joplate/presentation/widgets/profile_picture_widget.dart';
import 'package:joplate/presentation/widgets/user_plan_badge.dart';
import 'package:joplate/utils/log_visit.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class PlateRequestDetailsPage extends StatefulWidget {
  const PlateRequestDetailsPage({super.key, @PathParam('requestId') required this.requestId});

  final String requestId;

  @override
  State<PlateRequestDetailsPage> createState() => _PlateRequestDetailsPageState();
}

class _PlateRequestDetailsPageState extends State<PlateRequestDetailsPage> {
  late final Stream<PlateRequest> _plateStream;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _plateStream = FirebaseFirestore.instance
        .collection(platesRequestsCollectionId)
        .doc(widget.requestId)
        .snapshots()
        .map((snapshot) => PlateRequest.fromSnapshot(snapshot));

    _timer = Timer(const Duration(seconds: logVisitTimer), () {
      logVisit(
        listingId: widget.requestId,
        listingType: ListingType.request,
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
    return StreamBuilder<PlateRequest>(
        stream: _plateStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24, top: MediaQuery.of(context).size.height / 4),
              child: Text(
                'Error getteing data for Request',
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

          if (snapshot.data == null) {
            return const Center(
              child: Text(
                'No data found',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return Scaffold(
              appBar: AppBar(
                title: const Text('Plate Request Details'),
                actions: [
                  if (FirebaseAuth.instance.currentUser?.uid == snapshot.data!.userId) ...[
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        context.router.push(EditPlateRequestRoute(request: snapshot.data!));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => DeleteListingDialog(
                            listingId: widget.requestId,
                            itemType: ItemType.plateNumber,
                            listingType: ListingType.request,
                            plateNumber: snapshot.data!.item,
                          ),
                        );
                      },
                    ),
                  ]
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlateNumberRequestWidget(
                      item: snapshot.data!,
                      disabled: true,
                      priceLabelFontSize: 24,
                    ),
                    if (snapshot.data!.userId == FirebaseAuth.instance.currentUser?.uid &&
                        snapshot.data!.expiresAt != null &&
                        !snapshot.data!.isDisabled) ...[
                      const SizedBox(
                        height: 16,
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
                    const SizedBox(height: 16),
                    RequestedByWidgget(userId: snapshot.data!.userId, visits: snapshot.data!.visits),
                    const SizedBox(height: 16),
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
                              Icon(Icons.payments,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white70
                                      : const Color(0xFF981C1E)),
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
                              Icon(Icons.location_on,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white70
                                      : const Color(0xFF981C1E)),
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

class RequestedByWidgget extends StatefulWidget {
  const RequestedByWidgget({super.key, required this.userId, required this.visits});
  final String userId;
  final int visits;

  @override
  State<RequestedByWidgget> createState() => _RequestedByWidggetState();
}

class _RequestedByWidggetState extends State<RequestedByWidgget> {
  late final Stream<UserProfile> userProfileStream;
  late final Stream<UserPlans> userPlansStream;

  @override
  void initState() {
    super.initState();
    userProfileStream =
        FirebaseFirestore.instance.collection(userProfileCollectionId).doc(widget.userId).snapshots().map((snapshot) {
      return UserProfile.fromSnapshot(snapshot);
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
    return StreamBuilder<UserPlans>(
      stream: userPlansStream,
      builder: (context, plansSnapshot) {
        final plan = plansSnapshot.data?.plan ?? PlanType.free_plan;
        final isDark = Theme.of(context).brightness == Brightness.dark;

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
                          m.quicksale.requested_by,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        // Navigate to user profile
                        AutoRouter.of(context).push(UserProfileRoute(userId: widget.userId));
                      },
                      child: Row(
                        children: [
                          ProfilePictureWidget(
                            imageUrl: userProfile.imageUrl,
                            size: 50,
                            showUploadButton: false,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      userProfile.displayName,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
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
                  ],
                );
              }),
        );
      },
    );
  }
}
