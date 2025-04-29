import 'package:intl/intl.dart';

String formatPrice(num value) {
  return NumberFormat('#,###').format(value);
}
