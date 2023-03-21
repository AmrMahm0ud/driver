import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/data/sources/local/shared_preference/shared_preferences_manager.dart';

part 'driver_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DriverRequest<T> {
  @JsonKey(name: "userId")
  final int? userId;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "data")
  T? data;

  DriverRequest({this.userId, this.token, this.data});

  factory DriverRequest.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DriverRequestFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$DriverRequestToJson(this, (T) {
        return T;
      });

  Future<DriverRequest<T>> createRequest({T}) async {
    return DriverRequest(
      token:
          await SharedPreferenceManager().getFirebaseNotificationToken() ?? "",
      userId: await SharedPreferenceManager().getUserId() ?? 0,
      data: T,
    );
  }
}
