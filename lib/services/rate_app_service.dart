import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

@lazySingleton
class RateAppService {
  static const String _listingCountKey = 'listing_count';
  static const String _hasRatedKey = 'has_rated';
  static const String _neverShowAgainKey = 'never_show_rating';
  static const String _lastShownKey = 'last_shown_rating';
  static const int _showEveryNListings = 5;

  final SharedPreferences _prefs;
  final InAppReview _inAppReview = InAppReview.instance;

  RateAppService(this._prefs);

  // Get user-specific keys
  String get _userListingCountKey => '${_listingCountKey}_${_getCurrentUserId()}';
  String get _userHasRatedKey => '${_hasRatedKey}_${_getCurrentUserId()}';
  String get _userNeverShowAgainKey => '${_neverShowAgainKey}_${_getCurrentUserId()}';
  String get _userLastShownKey => '${_lastShownKey}_${_getCurrentUserId()}';

  String _getCurrentUserId() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser?.uid ?? 'anonymous';
  }

  Future<void> incrementListingCount() async {
    final currentCount = _prefs.getInt(_userListingCountKey) ?? 0;
    final newCount = currentCount + 1;
    await _prefs.setInt(_userListingCountKey, newCount);
    print('🔢 RateAppService: Incremented listing count to $newCount for user ${_getCurrentUserId()}');
  }

  Future<bool> shouldShowRateModal() async {
    // Don't show if user has already rated or selected never show again
    final hasRated = _prefs.getBool(_userHasRatedKey) ?? false;
    final neverShowAgain = _prefs.getBool(_userNeverShowAgainKey) ?? false;
    
    print('🔍 RateAppService: hasRated=$hasRated, neverShowAgain=$neverShowAgain for user ${_getCurrentUserId()}');

    if (hasRated) {
      print('❌ RateAppService: Not showing modal - user already rated');
      return false;
    }
    if (neverShowAgain) {
      print('❌ RateAppService: Not showing modal - user selected never show again');
      return false;
    }

    final currentCount = _prefs.getInt(_userListingCountKey) ?? 0;
    final lastShown = _prefs.getInt(_userLastShownKey) ?? 0;

    print('🔍 RateAppService: currentCount=$currentCount, lastShown=$lastShown');

    // Show after the first listing
    if (currentCount == 1 && lastShown == 0) {
      print('✅ RateAppService: Should show modal - first listing');
      return true;
    }

    // Show every 5 listings after the first one, but not if we've already shown it for this interval
    if (currentCount > 1) {
      final shouldShow = currentCount - lastShown >= _showEveryNListings;
      print('✅ RateAppService: Should show modal after ${currentCount} listings: $shouldShow');
      return shouldShow;
    }

    print('❌ RateAppService: Not showing modal - conditions not met');
    return false;
  }

  Future<void> markRateModalShown() async {
    final currentCount = _prefs.getInt(_userListingCountKey) ?? 0;
    await _prefs.setInt(_userLastShownKey, currentCount);
    print('✅ RateAppService: Marked modal as shown at count $currentCount for user ${_getCurrentUserId()}');
  }

  Future<void> markUserRated() async {
    await _prefs.setBool(_userHasRatedKey, true);
    print('✅ RateAppService: Marked user as rated: ${_getCurrentUserId()}');
  }

  Future<void> markNeverShowAgain() async {
    await _prefs.setBool(_userNeverShowAgainKey, true);
    print('✅ RateAppService: Marked never show again for user: ${_getCurrentUserId()}');
  }

  Future<bool> isAvailable() async {
    return await _inAppReview.isAvailable();
  }

  Future<void> requestReview() async {
    await _inAppReview.requestReview();
  }

  Future<void> openStoreListing() async {
    await _inAppReview.openStoreListing();
  }

  // Method to be called after successful listing/request posting
  Future<void> onListingPosted(BuildContext context) async {
    print('🚀 RateAppService: onListingPosted called');
    
    await incrementListingCount();

    if (await shouldShowRateModal()) {
      print('🎉 RateAppService: Showing rate modal');
      await markRateModalShown();

      // Show the native rate modal directly
      await _showNativeRateModal();
    } else {
      print('❌ RateAppService: Not showing rate modal');
    }
  }

  Future<void> _showNativeRateModal() async {
    print('📱 RateAppService: Displaying native rate modal directly');
    
    try {
      if (await isAvailable()) {
        print('✅ RateAppService: In-app review available, requesting review');
        await requestReview();
      } else {
        print('❌ RateAppService: In-app review not available, opening store listing');
        await openStoreListing();
      }
      
      // Mark user as rated since they interacted with the native modal
      await markUserRated();
    } catch (e) {
      print('❌ RateAppService: Error showing native modal: $e');
    }
  }
}
