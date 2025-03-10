import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/phone_number.dart';

/// Repository class for handling Firestore operations for listings.
@LazySingleton()
class FirestoreListingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Methods for PlateNumber listings
  Future<void> createPlateNumberListing(Listing<PlateNumber> listing) async {
    final collection = _firestore.collection('plate_number_listings');
    await collection.add(listing.toJson());
  }

  Future<void> updatePlateNumberListing(String id, Listing<PlateNumber> listing) async {
    final collection = _firestore.collection('plate_number_listings');
    await collection.doc(id).update(listing.toJson());
  }

  Future<void> deletePlateNumberListing(String id) async {
    final collection = _firestore.collection('plate_number_listings');
    await collection.doc(id).delete();
  }

  // Stream<List<Listing<PlateNumber>>> getPlateNumberListings() {
  //   final collection = _firestore.collection('plate_number_listings');
  //   return collection.snapshots().map((snapshot) =>
  //       snapshot.docs.map((doc) => Listing.fromJson(doc.data(), (json) => PlateNumber.fromJson(json))).toList());
  // }

  // Methods for PhoneNumber listings
  Future<void> createPhoneNumberListing(Listing<PhoneNumber> listing) async {
    final collection = _firestore.collection('phone_number_listings');
    await collection.add(listing.toJson());
  }

  Future<void> updatePhoneNumberListing(String id, Listing<PhoneNumber> listing) async {
    final collection = _firestore.collection('phone_number_listings');
    await collection.doc(id).update(listing.toJson());
  }

  Future<void> deletePhoneNumberListing(String id) async {
    final collection = _firestore.collection('phone_number_listings');
    await collection.doc(id).delete();
  }

  // Stream<List<Listing<PhoneNumber>>> getPhoneNumberListings() {
  //   final collection = _firestore.collection('phone_number_listings');
  //   return collection.snapshots().map((snapshot) =>
  //       snapshot.docs.map((doc) => Listing.fromJson(doc.data(), (json) => PhoneNumber.fromJson(json))).toList());
  // }
}
