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
    
    try {
      // Simple configuration with basic options only
      final pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 800, // Reduced size
        maxHeight: 800, // Reduced size
        imageQuality: 70, // Reduced quality
      );

      if (pickedFile == null) return;

      setState(() {
        _isUploading = true;
      });

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You must be logged in to upload images')),
        );
        setState(() {
          _isUploading = false;
        });
        return;
      }

      // Simple approach: use the picked file directly
      final imageFile = File(pickedFile.path);
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename = '${currentUser.uid}_$timestamp.jpg';

      // Get file size for diagnostic purposes
      final fileSize = await imageFile.length();
      print('Image file size: ${(fileSize / 1024).toStringAsFixed(2)} KB');

      // Use a simple reference path
      final storageRef = FirebaseStorage.instance.ref().child('profile_images').child(filename);

      try {
        // Simplest upload approach
        final uploadTask = storageRef.putFile(imageFile);

        // Add progress listener for diagnostics
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          final progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          print('Upload progress: ${progress.toStringAsFixed(2)}%');
        });

        // Wait for upload to complete
        await uploadTask;
        print('Upload completed successfully');

        // Get download URL
        final downloadUrl = await storageRef.getDownloadURL();
        print('Download URL obtained: $downloadUrl');
        
        // Update Firestore
        print('Updating Firestore with new image URL');
        await FirebaseFirestore.instance
            .collection(userProfileCollectionId)
            .doc(currentUser.uid)
            .update({'imageUrl': downloadUrl});

        if (widget.onImageUpdated != null) {
          widget.onImageUpdated!(downloadUrl);
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile picture updated successfully')),
          );
        }
      } catch (e) {
        print('===== FIREBASE UPLOAD ERROR =====');
        print('Error type: ${e.runtimeType}');
        print('Error message: $e');

        if (e is FirebaseException) {
          print('Firebase error code: ${e.code}');
          print('Firebase error message: ${e.message}');
          print('Firebase error details: ${e.stackTrace}');
        }

        String errorMessage = 'Failed to upload image';

        if (e.toString().contains('parse response') ||
            e.toString().contains('network') ||
            e.toString().contains('timeout')) {
          errorMessage = 'Network error. Check your connection and try again with a smaller image.';
        } else if (e is FirebaseException) {
          switch (e.code) {
            case 'unauthorized':
            case 'permission-denied':
              errorMessage = 'Not authorized to upload. Please log in again.';
              break;
            case 'storage/quota-exceeded':
              errorMessage = 'Storage quota exceeded.';
              break;
            default:
              errorMessage = 'Upload failed: ${e.message ?? e.code}';
          }
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      }
    } catch (e) {
      print('Error selecting image: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error selecting image: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const primaryColor = Color(0xFF981C1E);

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
                child: const Center(
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
