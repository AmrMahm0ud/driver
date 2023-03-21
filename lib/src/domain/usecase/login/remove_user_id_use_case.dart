import 'package:untitled/src/data/sources/local/shared_preference/shared_preferences_manager.dart';

class RemoveUserIdUseCase {
  final SharedPreferenceManager sharedPreferenceManager;

  RemoveUserIdUseCase(this.sharedPreferenceManager);

  Future<bool> call() async {
    return await sharedPreferenceManager.removeUserId();
  }
}
