// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverRequest<T> _$DriverRequestFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    DriverRequest<T>(
      userId: json['userId'] as int?,
      token: json['token'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$DriverRequestToJson<T>(
  DriverRequest<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
