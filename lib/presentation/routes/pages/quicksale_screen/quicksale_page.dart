import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/user_details_widget.dart';

@RoutePage()
class QuicksalePage extends StatefulWidget {
  const QuicksalePage({super.key});

  @override
  State<QuicksalePage> createState() => _QuicksalePageState();
}

class _QuicksalePageState extends State<QuicksalePage> {
  late final Stream<List<String>> _profilesIdsStream;

  @override
  void initState() {
    super.initState();
    _profilesIdsStream =
        FirebaseFirestore.instance
        .collection(quicksaleProfilesCollectionId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => UserProfile.fromSnapshot(doc).id).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(m.quicksale.title),
      ),
      body: StreamBuilder<List<String>>(
        stream: _profilesIdsStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading profiles'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final profiles = snapshot.data ?? [];

          if (profiles.isEmpty) {
            return const Center(child: Text('No sellers available'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  m.quicksale.description,
                  style: const TextStyle(),
                ),
                ...profiles.map((profileId) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: UserDetailsWidget(
                        userId: profileId,
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
