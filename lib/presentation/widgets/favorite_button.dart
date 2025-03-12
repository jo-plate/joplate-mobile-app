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
          ? favorites.favoritePlates.contains(widget.listingId)
          : favorites.favoritePhones.contains(widget.listingId);
    });
  }

  Future<bool> _checkFavorite() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    final snapshot = await FirebaseFirestore.instance.collection(favoritesCollectionId).doc(user.uid).get();
    final data = snapshot.data();
    if (data == null) return false;
    final favorites = UserFavorites.fromJson(data);

    return widget.itemType == ItemType.plateNumber
        ? favorites.favoritePlates.contains(widget.listingId)
        : favorites.favoritePhones.contains(widget.listingId);
  }

  Future<void> _toggleFavorite() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final isFavorite = await _checkFavorite();
    if (!isFavorite) {
      await FirebaseFirestore.instance.collection(favoritesCollectionId).doc(user.uid).set({
        widget.itemType == ItemType.plateNumber ? 'favoritePlates' : 'favoritePhones':
            FieldValue.arrayUnion([widget.listingId])
      }, SetOptions(merge: true));
    } else {
      await FirebaseFirestore.instance.collection(favoritesCollectionId).doc(user.uid).set({
        widget.itemType == ItemType.plateNumber ? 'favoritePlates' : 'favoritePhones':
            FieldValue.arrayRemove([widget.listingId])
      }, SetOptions(merge: true));
    }
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
            await _toggleFavorite();
          },
        );
      },
    );
  }
}
