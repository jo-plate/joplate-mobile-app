import 'package:intl/intl.dart';

String formatPrice(num value) {
  return NumberFormat('#,###').format(value);
}

String formatCreatedAt(DateTime createdAt) {
  final now = DateTime.now();
  final difference = now.difference(createdAt);
  if (difference.inDays > 0) {
    return '${difference.inDays} Days ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} Hours ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} Minutes ago';
  } else {
    return "Just now";
  }
}
