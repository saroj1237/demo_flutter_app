import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class LocalStorage {
  LocalStorage(this.sharedPreferences);

  static const accessTokenKey = 'accessToken';

  final SharedPreferences sharedPreferences;

  Future<void> setAccessToken(String token) async {
    await sharedPreferences.setString(accessTokenKey, token);
  }

  String? getAccessToken() {
    return sharedPreferences.getString(accessTokenKey);
  }

  Future<bool> removeAccessToken() async {
    return sharedPreferences.remove(accessTokenKey);
  }
}
