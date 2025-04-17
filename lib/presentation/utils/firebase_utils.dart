import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';

Future<List<PlateNumber>> fetchPlates(List<String> plateIds) async {
  final List<PlateNumber?> plates = await Future.wait(
    plateIds.map((id) async {
      final plateDoc = await FirebaseFirestore.instance
          .collection(carPlatesCollectionId)
          .doc(id)
          .get();
      if (plateDoc.exists) {
        final plateDict = plateDoc.data() ?? {};
        plateDict['id'] = id;
        return PlateNumber.fromJson(plateDict);
      }
      return null;
    }),
  );

  return plates.whereType<PlateNumber>().toList(); // Filter out null values
}

Future<List<PhoneListing>> fetchPhones(List<PhoneListing> phoneIds) async {
  final List<PhoneListing?> phones = await Future.wait(
    phoneIds.map((phone) async {
      final phoneDoc = await FirebaseFirestore.instance
          .collection(phoneNumbersCollectionId)
          .doc(phone.id)
          .get();
      if (phoneDoc.exists) {
        final phoneDict = phoneDoc.data() ?? {};
        return PhoneListing.fromJson({...phoneDict, 'id': phoneDoc.id});
      }
      return null;
    }),
  );

  return phones.whereType<PhoneListing>().toList(); // Filter out null values
}
