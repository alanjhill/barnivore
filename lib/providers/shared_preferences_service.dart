import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesServiceProvider = Provider<SharedPreferencesService>((ref) => throw UnimplementedError());

class SharedPreferencesService {
  SharedPreferencesService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const kDarkMode = 'dark-mode';

  Future<void> setDarkMode(bool darkMode) async {
    await sharedPreferences.setBool(kDarkMode, darkMode);
  }

  bool getDarkMode() {
    return sharedPreferences.getBool(kDarkMode) ?? false;
  }
}
