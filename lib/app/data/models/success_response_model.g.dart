// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResponseModel _$SuccessResponseModelFromJson(
        Map<String, dynamic> json) =>
    SuccessResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      response: json['response'] as Map<String, dynamic>?,
      otherResponse: json['otherResponse'] as Map<String, dynamic>?,
      responseObj: json['responseObj'],
    );

Map<String, dynamic> _$SuccessResponseModelToJson(
        SuccessResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'response': instance.response,
      'otherResponse': instance.otherResponse,
      'responseObj': instance.responseObj,
    };
