part of 'edit_phone_request_cubit.dart';

/// State for editing an existing phone request
class EditPhoneRequestState {
  final String requestId;
  final String price; // optional, stored as string for easy text field
  final bool isSubmitting;
  final String? errorMessage;

  const EditPhoneRequestState({
    required this.requestId,
    required this.price,
    required this.isSubmitting,
    this.errorMessage,
  });

  EditPhoneRequestState copyWith({
    String? requestId,
    String? number,
    String? price,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return EditPhoneRequestState(
      requestId: requestId ?? this.requestId,
      price: price ?? this.price,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }
}
