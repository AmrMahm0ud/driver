import 'package:json_annotation/json_annotation.dart';

part 'driver_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DriverResponse<T> {
  @JsonKey(name: "resultCode")
  final int? resultCode;
  @JsonKey(name: "resultMessage")
  final String? resultMassage;
  @JsonKey(name: "data")
  T? data;

  DriverResponse({this.resultCode, this.resultMassage, this.data});

  factory DriverResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DriverResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$DriverResponseToJson(this, (T) {
        return T;
      });
}
