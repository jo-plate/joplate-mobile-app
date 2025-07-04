import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:get_it/get_it.dart';

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

  Future<void> incrementListingCount() async {
    final currentCount = _prefs.getInt(_listingCountKey) ?? 0;
    await _prefs.setInt(_listingCountKey, currentCount + 1);
  }

  Future<bool> shouldShowRateModal() async {
    // Don't show if user has already rated or selected never show again
    if (_prefs.getBool(_hasRatedKey) ?? false) return false;
    if (_prefs.getBool(_neverShowAgainKey) ?? false) return false;

    final currentCount = _prefs.getInt(_listingCountKey) ?? 0;
    final lastShown = _prefs.getInt(_lastShownKey) ?? 0;

    // Show every 5 listings, but not if we've already shown it for this interval
    return currentCount >= _showEveryNListings && currentCount - lastShown >= _showEveryNListings;
  }

  Future<void> markRateModalShown() async {
    final currentCount = _prefs.getInt(_listingCountKey) ?? 0;
    await _prefs.setInt(_lastShownKey, currentCount);
  }

  Future<void> markUserRated() async {
    await _prefs.setBool(_hasRatedKey, true);
  }

  Future<void> markNeverShowAgain() async {
    await _prefs.setBool(_neverShowAgainKey, true);
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
    await incrementListingCount();

    if (await shouldShowRateModal()) {
      await markRateModalShown();

      // Show the rate modal
      if (context.mounted) {
        _showRateModal(context);
      }
    }
  }

  void _showRateModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const RateAppModal(),
    );
  }
}

class RateAppModal extends StatelessWidget {
  const RateAppModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.all(24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star_rounded,
            size: 48,
            color: Colors.amber,
          ),
          const SizedBox(height: 16),
          const Text(
            'Enjoying Joplate?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Your feedback helps us improve! A 5-star rating would mean the world to us 🌟',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    final service = GetIt.instance<RateAppService>();
                    await service.markNeverShowAgain();
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Never ask again',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Maybe later'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final service = GetIt.instance<RateAppService>();
                    await service.markUserRated();

                    if (await service.isAvailable()) {
                      await service.requestReview();
                    } else {
                      await service.openStoreListing();
                    }

                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF981C1E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Rate 5 stars ⭐'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
