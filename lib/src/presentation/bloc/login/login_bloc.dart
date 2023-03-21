import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/login/request/sign_in_request.dart';
import 'package:untitled/src/domain/usecase/login/login_use_case.dart';
import 'package:untitled/src/domain/usecase/login/remove_user_id_use_case.dart';
import 'package:untitled/src/domain/usecase/login/set_user_id_use_case.dart';
import 'package:untitled/src/presentation/bloc/login/login_event.dart';
import 'package:untitled/src/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final SetUserIdUseCase _setUserIdUseCase;
  final RemoveUserIdUseCase _removeUserIdUseCase;

  LoginBloc(
      this._loginUseCase, this._setUserIdUseCase, this._removeUserIdUseCase)
      : super(InitialLoginState()) {
    on<LoginUserEvent>(_onLoginUserEvent);
    on<LoginPopEvent>(_onLoginPopEvent);
  }

  Future<void> _onLoginUserEvent(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    _removeUserIdUseCase();
    emit(LoginLoadingState());
    DataState dataState =
        await _loginUseCase.call(LoginRequest(event.userName, event.password));

    if (dataState is DataSuccess) {
      emit(SuccessLoginState());
      _setUserIdUseCase(dataState.data.userId);
    } else if (dataState is DataFailed) {
      emit(FailLoginState(errorMassage: dataState.error?.message));
    }
  }

  void _onLoginPopEvent(LoginPopEvent event, Emitter<LoginState> emit) {
    emit(LoginPopState());
  }
}
