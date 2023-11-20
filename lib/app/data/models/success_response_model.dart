import 'package:challenge/app/domain/entities/success_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'success_response_model.g.dart';

@JsonSerializable()
class SuccessResponseModel extends SuccessResponse {
  const SuccessResponseModel({
    required bool success,
    required String message,
    Map<String, dynamic>?response,
    Map<String, dynamic>? otherResponse,
    Object? responseObj,
  }): super(
    success: success,
    message: message,
    response: response,
    otherResponse: otherResponse,
    responseObj: responseObj,
  );

  factory SuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, response, otherResponse];
}
