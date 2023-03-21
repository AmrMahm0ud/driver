import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/login/request/sign_in_request.dart';
import 'package:untitled/src/domain/entities/login/user.dart';
import 'package:untitled/src/domain/repositories/login/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  const LoginUseCase(this._loginRepository);

  Future<DataState<User>> call(LoginRequest request) async {
    return await _loginRepository.login(request);
  }
}
