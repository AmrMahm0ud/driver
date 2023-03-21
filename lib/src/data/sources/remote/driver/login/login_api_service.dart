
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled/src/data/sources/remote/driver/api_key.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_request.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_response.dart';
import 'package:untitled/src/data/sources/remote/driver/login/models/remote_user.dart';
import 'package:untitled/src/data/sources/remote/driver/login/request/sign_in_request.dart';

part 'login_api_service.g.dart';

@RestApi()
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(ApiKeys.login)
  Future<HttpResponse<DriverResponse<RemoteUser>>> signIn(
      @Body() DriverRequest<LoginRequest> request);
}