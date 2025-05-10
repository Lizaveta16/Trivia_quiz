import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  static const String token = 'sessionToken';
  static const String useCache = 'useCache';
}

class SharedPreferencesProvider {
  late final SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  String? get sessionToken {
    return _sharedPreferences.getString(SharedPreferencesKeys.token);
  }

  Future<void> saveSessionToken(String token) async {
    await _sharedPreferences.setString(
      SharedPreferencesKeys.token,
      token,
    );
  }

  Future<void> deleteData() async {
    await _sharedPreferences.remove(SharedPreferencesKeys.token);
  }

  bool get useCache {
    return _sharedPreferences.getBool(SharedPreferencesKeys.useCache) ?? false;
  }

  Future<void> saveUseCacheStatus(bool useCache) async {
    await _sharedPreferences.setBool(
      SharedPreferencesKeys.useCache,
      useCache,
    );
  }
}
