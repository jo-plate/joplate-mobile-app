import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/user_favorites.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.itemType, required this.listingId});

  final ItemType itemType;

  const FavoriteButton.plate({super.key, required this.listingId}) : itemType = ItemType.plateNumber;
  const FavoriteButton.phone({super.key, required this.listingId}) : itemType = ItemType.phoneNumber;

  final String listingId;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late final Stream<bool> _isFavorite;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    _isFavorite =
        FirebaseFirestore.instance.collection(favoritesCollectionId).doc(user.uid).snapshots().map((snapshot) {
      final data = snapshot.data();
      if (data == null) return false;
      final favorites = UserFavorites.fromJson(data);

      return widget.itemType == ItemType.plateNumber
          ? favorites.favoritePlatesIds.contains(widget.listingId)
          : favorites.favoritePhonesIds.contains(widget.listingId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _isFavorite,
      builder: (context, snapshot) {
        final isFavorite = snapshot.data ?? false;
        return IconButton(
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: const Color(0xFF981C1E)),
          onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;

            if (user == null) return;

            if (!isFavorite) {
              await FirebaseFirestore.instance.collection(favoritesCollectionId).doc(user.uid).set({
                widget.itemType == ItemType.plateNumber ? 'favoritePlatesIds' : 'favoritePhonesIds':
                    FieldValue.arrayUnion([widget.listingId])
              }, SetOptions(merge: true));
              print('added to favorites for user ${user.uid}');
            } else {
              await FirebaseFirestore.instance.collection(favoritesCollectionId).doc(user.uid).set({
                widget.itemType == ItemType.plateNumber ? 'favoritePlatesIds' : 'favoritePhonesIds':
                    FieldValue.arrayRemove([widget.listingId])
              }, SetOptions(merge: true));
              print('removed from favorites for user ${user.uid}');
            }

            setState(() {});
          },
        );
      },
    );
  }
}
