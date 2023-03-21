import 'package:untitled/src/data/sources/local/shared_preference/shared_preferences_manager.dart';

class SetUserIdUseCase {
  final SharedPreferenceManager _sharedPreferenceManager;

  SetUserIdUseCase(this._sharedPreferenceManager);

  Future<bool> call(int userId) async {
    return await _sharedPreferenceManager.setUserId(userId);
  }
}
