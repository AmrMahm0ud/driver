import 'package:untitled/src/data/sources/local/shared_preference/shared_preferences_keys.dart';
import 'package:untitled/src/data/sources/local/shared_preference/shared_preferences_utlis.dart';

class SharedPreferenceManager {
  static final SharedPreferenceManager _sharedPreference =
      SharedPreferenceManager._internal();

  factory SharedPreferenceManager() {
    return _sharedPreference;
  }

  SharedPreferenceManager._internal();

  Future<bool> setUserId(int userId) async {
    return await SharedPreferencesUtils.setInt(
        SharedPreferenceKeys.userId, userId);
  }

  Future<int?> getUserId() async {
    return await SharedPreferencesUtils.getInt(SharedPreferenceKeys.userId);
  }

  Future<bool> removeUserId() async {
    return (await SharedPreferencesUtils.remove(SharedPreferenceKeys.userId) ??
        false);
  }

  Future<bool> setFirebaseNotificationToken(String notificationToken) async {
    return await SharedPreferencesUtils.setString(
        SharedPreferenceKeys.notificationToken, notificationToken);
  }

  Future<String?> getFirebaseNotificationToken() async {
    return await SharedPreferencesUtils.getString(
        SharedPreferenceKeys.notificationToken);
  }
}
