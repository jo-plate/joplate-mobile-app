import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/apply_promo_code_dto.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

class PromoCodeDialog extends StatefulWidget {
  const PromoCodeDialog({super.key});

  @override
  State<PromoCodeDialog> createState() => _PromoCodeDialogState();
}

class _PromoCodeDialogState extends State<PromoCodeDialog> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _applyPromoCode() async {
    final m = Localization.of(context);
    final code = _controller.text.trim();

    if (code.isEmpty) {
      AppSnackbar.showError(m.common.invalid_promo_code);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await FirebaseFunctions.instance
          .httpsCallable(applyPromoCodeCF)
          .call(ApplyPromoCodeDto(promoCode: code.toUpperCase()).toJson());

      if (result.data['success'] == true) {
        if (mounted) {
          Navigator.pop(context);
          AppSnackbar.showSuccess(m.common.promo_code_applied);
        }
      } else {
        AppSnackbar.showError(result.data['message'] ?? m.common.invalid_promo_code);
      }
    } on FirebaseFunctionsException catch (e) {
      AppSnackbar.showError(e.message ?? m.common.error_applying_promo_code);
    } catch (e) {
      AppSnackbar.showError(m.common.error_applying_promo_code);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              m.profile.promo_code,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.characters,
              style: const TextStyle(
                letterSpacing: 1.2,
              ),
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              decoration: InputDecoration(
                hintText: m.profile.promo_code_hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _isLoading ? null : () => Navigator.pop(context),
                  child: Text(m.common.cancel),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _isLoading ? null : _applyPromoCode,
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          m.common.confirm,
                          style: const TextStyle(color: Colors.white),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
