import 'package:flutter/material.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'feature_plan_dialog.dart';

class PromotePromptDialog extends StatelessWidget {
  const PromotePromptDialog({
    super.key,
    required this.listingId,
    required this.itemType,
  });

  final String listingId;
  final ItemType itemType;

  static const Color _bg = Color(0xFFFAFAFA); // card background
  static const Color _accent = Color(0xFF981C1E); // brand red
  static const Color _accentDim = Color(0x80981C1E); // 50 % opacity
  static const Color _gold = Color(0xFFFFC107); // gold CTA

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // ▶ transparent backdrop
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ────────────── CARD ──────────────
          Container(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
            decoration: BoxDecoration(
              color: _bg,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 14,
                  offset: Offset(0, 6),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'بيع أسرع!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                const Text(
                  'زد ظهور إعلانك 10 مرات.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _accent,
                          side: const BorderSide(color: _accent),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('إلغاء'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: _gold,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (_) => FeaturePlanDialog(
                              listingId: listingId,
                              itemType: itemType,
                            ),
                          );
                        },
                        child: const Text('ترقية'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ────────────── FLOATING ICON ──────────────
          const Positioned(
            top: -32,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: _gold,
              child: Icon(Icons.rocket_launch_rounded, size: 36, color: _accent),
            ),
          ),
        ],
      ),
    );
  }
}
