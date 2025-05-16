import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePictureWidget extends StatefulWidget {
  final String? imageUrl;
  final double size;
  final bool showUploadButton;
  final Function(String imageUrl)? onImageUpdated;

  const ProfilePictureWidget({
    super.key,
    this.imageUrl,
    this.size = 100.0,
    this.showUploadButton = false,
    this.onImageUpdated,
  });

  @override
  State<ProfilePictureWidget> createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  bool _isUploading = false;

  Future<void> _showImageSourceDialog() async {
    final m = Localization.of(context);
    final primaryColor = Theme.of(context).colorScheme.primary;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(m.profile.choose_source),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.photo_library, color: primaryColor),
              title: Text(m.profile.gallery),
              onTap: () {
                Navigator.of(context).pop();
                _pickAndUploadImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt, color: primaryColor),
              title: Text(m.profile.camera),
              onTap: () {
                Navigator.of(context).pop();
                _pickAndUploadImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickAndUploadImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) return;

      final imageFile = File(pickedFile.path);
      final storageRef = FirebaseStorage.instance.ref().child('profile_images').child('${currentUser.uid}.jpg');

      // Upload the image
      await storageRef.putFile(imageFile);

      // Get the download URL
      final downloadUrl = await storageRef.getDownloadURL();

      // Update the user profile with the image URL
      await FirebaseFirestore.instance
          .collection(userProfileCollectionId)
          .doc(currentUser.uid)
          .update({'imageUrl': downloadUrl});

      if (widget.onImageUpdated != null) {
        widget.onImageUpdated!(downloadUrl);
      }
    } catch (e) {
      // Handle errors
      print('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF981C1E);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty)
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl!,
              width: widget.size,
              height: widget.size,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[300],
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: widget.size,
                height: widget.size,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/avatar3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        else
          Container(
            width: widget.size,
            height: widget.size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/avatar3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        if (_isUploading)
          Container(
            width: widget.size,
            height: widget.size,
            decoration: const BoxDecoration(
              color: Colors.black38,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        if (widget.showUploadButton)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: widget.showUploadButton ? _showImageSourceDialog : null,
              child: Container(
                width: widget.size,
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.size / 2),
                  ),
                ),
                child: Text(
                  m.profile.upload,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
