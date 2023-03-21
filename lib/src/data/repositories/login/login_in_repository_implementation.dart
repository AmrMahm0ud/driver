import 'dart:io';

import 'package:dio/dio.dart';
import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_request.dart';
import 'package:untitled/src/data/sources/remote/driver/login/login_api_service.dart';
import 'package:untitled/src/data/sources/remote/driver/login/request/sign_in_request.dart';
import 'package:untitled/src/domain/entities/login/user.dart';
import 'package:untitled/src/domain/repositories/login/login_repository.dart';

class LoginRepositoryImplementation extends LoginRepository {
  final LoginApiService _loginApiService;

  LoginRepositoryImplementation(this._loginApiService);

  @override
  Future<DataState<User>> login(LoginRequest request) async {
    DriverRequest<LoginRequest> driverRequest =
        await DriverRequest<LoginRequest>().createRequest(T: request);
    final httpResponse = await _loginApiService.signIn(driverRequest);

    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if (httpResponse.data.resultCode == 1) {
          return DataSuccess(httpResponse.data.data!);
        } else {
          return DataFailed(DioError(
            error: httpResponse.data.resultMassage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
          ));
        }
      }
      return DataFailed(DioError(
        error: httpResponse.response.statusMessage,
        requestOptions: httpResponse.response.requestOptions,
        response: httpResponse.response,
      ));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
