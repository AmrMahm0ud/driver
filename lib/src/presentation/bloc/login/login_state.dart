import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class InitialLoginState extends LoginState {}

class LoginLoadingState extends LoginState {}

class SuccessLoginState extends LoginState {}

class FailLoginState extends LoginState {
  final String? errorMassage;

  FailLoginState({required this.errorMassage});
}

class LoginNetworkErrorState extends LoginState {
  final String? errorMassage;

  LoginNetworkErrorState({required this.errorMassage});
}

class LoginPopState extends LoginState {}
