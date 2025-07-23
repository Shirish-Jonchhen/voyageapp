// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_exceptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppException _$AppExceptionFromJson(Map<String, dynamic> json) =>
    _AppException(
      message: json['message'] as String,
      statusCode: (json['status_code'] as num?)?.toInt(),
      errors: json['errors'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AppExceptionToJson(_AppException instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'errors': instance.errors,
    };
