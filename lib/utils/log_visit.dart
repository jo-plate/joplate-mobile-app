import 'package:cloud_functions/cloud_functions.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/log_visit_dto.dart';

Future<void> logVisit({
  required String listingId,
  required ListingType listingType,
  required ItemType itemType,
}) async {
  try {
    final functions = FirebaseFunctions.instance;
    final callable = functions.httpsCallable(logVisitCF);

    final dto = LogVisitDto(
      listingId: listingId,
      listingType: listingType,
      itemType: itemType,
    );

    await callable.call(dto.toJson());
  } catch (e) {
    print(e);
  }
}
