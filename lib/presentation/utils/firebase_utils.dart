import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/domain/entities/plate_listing.dart';

Future<List<PlateListing>> fetchPlates(List<String> plateIds) async {
  final List<PlateListing?> plates = await Future.wait(
    plateIds.map((id) async {
      final plateDoc = await FirebaseFirestore.instance
          .collection(carPlatesCollectionId)
          .doc(id)
          .get();
      if (plateDoc.exists) {
        return PlateListing.fromSnapshot(plateDoc);
      }
      return null;
    }),
  );

  return plates.whereType<PlateListing>().toList(); // Filter out null values
}

Future<List<PhoneListing>> fetchPhones(List<String> phoneIds) async {
  final List<PhoneListing?> phones = await Future.wait(
    phoneIds.map((phone) async {
      final phoneDoc = await FirebaseFirestore.instance
          .collection(phoneNumbersCollectionId)
          .doc(phone)
          .get();
      if (phoneDoc.exists) {
        return PhoneListing.fromSnapshot(phoneDoc);
      }
      return null;
    }),
  );

  return phones.whereType<PhoneListing>().toList(); // Filter out null values
}
