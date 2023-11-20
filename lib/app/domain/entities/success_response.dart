import 'package:equatable/equatable.dart';

abstract class SuccessResponse extends Equatable {
  const SuccessResponse({
    required this.success,
    required this.message,
    this.response,
    this.otherResponse,
    this.responseObj,
  });

  final bool success;
  final String message;
  final Map<String, dynamic>? response;
  final Map<String, dynamic>? otherResponse;
  final Object? responseObj;

  @override
  List<Object?> get props => [success, message, response, otherResponse];

}
