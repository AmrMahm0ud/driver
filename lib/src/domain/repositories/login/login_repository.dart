import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/login/request/sign_in_request.dart';
import 'package:untitled/src/domain/entities/login/user.dart';

abstract class LoginRepository {
  Future<DataState<User>> login(LoginRequest request);
}
