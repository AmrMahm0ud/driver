import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class LoginUserEvent extends LoginEvent {
  final String? userName, password;

  LoginUserEvent({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}

class LoginPopEvent extends LoginEvent {}
