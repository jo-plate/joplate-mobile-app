import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/domain/entities/plate_listing.dart';

Future<List<PlateListing>> fetchPlates(List<String> plateIds) async {
  final List<PlateListing?> plates = await Future.wait(
    plateIds.map((id) async {
      final plateDoc = await FirebaseFirestore.instance.collection(carPlatesCollectionId).doc(id).get();
      if (plateDoc.exists) {
        final listing = PlateListing.fromSnapshot(plateDoc);
        if (listing.isDisabled || listing.isExpired) {
          return null; // Return null if the listing is disabled or deleted
        }
        return listing;
      }
      return null;
    }),
  );

  return plates.whereType<PlateListing>().toList(); // Filter out null values
}

Future<List<PhoneListing>> fetchPhones(List<String> phoneIds) async {
  final List<PhoneListing?> phones = await Future.wait(
    phoneIds.map((phone) async {
      final phoneDoc = await FirebaseFirestore.instance.collection(phoneNumbersCollectionId).doc(phone).get();
      if (phoneDoc.exists) {
        final listing = PhoneListing.fromSnapshot(phoneDoc);
        if (listing.isDisabled || listing.isExpired) {
          return null; // Return null if the listing is disabled or deleted
        }
        return listing;
      }
      return null;
    }),
  );

  return phones.whereType<PhoneListing>().toList(); // Filter out null values
}
