import 'package:flutter/material.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.itemType});

  final ItemType itemType;

  const FavoriteButton.plate({super.key}) : itemType = ItemType.plateNumber;
  const FavoriteButton.phone({super.key}) : itemType = ItemType.phoneNumber;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false; // State to track favorite

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: const Color(0xFF981C1E)),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
