// lib/presentation/routes/pages/edit_plate_request_screen/cubit/edit_plate_request_state.dart

part of 'edit_plate_request_cubit.dart';

/// State for editing an existing plate request
class EditPlateRequestState {
  final String requestId;
  final String code;
  final String number;
  final String price; // optional
  final bool isSubmitting;
  final String? errorMessage;

  const EditPlateRequestState({
    required this.requestId,
    required this.code,
    required this.number,
    required this.price,
    required this.isSubmitting,
    this.errorMessage,
  });

  EditPlateRequestState copyWith({
    String? requestId,
    String? code,
    String? number,
    String? price,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return EditPlateRequestState(
      requestId: requestId ?? this.requestId,
      code: code ?? this.code,
      number: number ?? this.number,
      price: price ?? this.price,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }
}
