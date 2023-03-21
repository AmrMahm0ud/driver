import 'package:untitled/src/domain/entities/login/user.dart';

class RemoteUser extends User {
  final int userId;
  final String userName;

  RemoteUser({required this.userId,  this.userName = ""})
      : super(id: userId, name: userName ?? "");

  factory RemoteUser.fromJson(Map<String, dynamic> json) =>
      RemoteUser(userId: json['id'], userName: json['userName'] ?? "");
}
