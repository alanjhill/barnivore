import 'package:barnivore/providers/shared_preferences_service.dart';
import 'package:barnivore/theme/palette.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

final appSettingsProvider = StateNotifierProvider<AppSettingsNotifier, AppSettings>((ref) {
  final sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
  return AppSettingsNotifier(sharedPreferencesService);
});

class AppSettingsNotifier extends StateNotifier<AppSettings> {
  AppSettingsNotifier(this.sharedPreferencesService) : super(AppSettings());
  final SharedPreferencesService sharedPreferencesService;

  void init() {
    final newState = state.copyWith(
      darkMode: sharedPreferencesService.getDarkMode(),
    );
    state = newState;
  }

  Future<void> setDarkMode(bool darkMode) async {
    final newState = state.copyWith(darkMode: darkMode);
    if (darkMode) {
      await FlutterStatusbarcolor.setStatusBarColor(Palette.almostBlack);
    } else {
      await FlutterStatusbarcolor.setStatusBarColor(Palette.primaryColor);
    }
    state = newState;
    await sharedPreferencesService.setDarkMode(darkMode);
  }

  Future<void> toggleDarkMode() async {
    final newState = state.copyWith(darkMode: !state.darkMode!);
    state = newState;
    if (state.darkMode!) {
      await FlutterStatusbarcolor.setStatusBarColor(Palette.almostBlack);
    } else {
      await FlutterStatusbarcolor.setStatusBarColor(Palette.primaryColor);
    }
    await sharedPreferencesService.setDarkMode(state.darkMode!);
  }
}

class AppSettings {
  bool? darkMode;

  AppSettings({this.darkMode = false});

  AppSettings copyWith({
    bool? darkMode,
  }) =>
      AppSettings(
        darkMode: darkMode ?? this.darkMode,
      );
}
