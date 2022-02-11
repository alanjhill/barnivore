import 'package:barnivore/features/home/home_screen.dart';
import 'package:barnivore/features/search_flow/search_flow.dart';
import 'package:barnivore/providers/app_settings.dart';
import 'package:barnivore/providers/shared_preferences_service.dart';
import 'package:barnivore/routing/app_router.dart';
import 'package:barnivore/theme/barnivore_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: 'http://www.barnivore.com',
  ));
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesServiceProvider.overrideWithValue(
          SharedPreferencesService(sharedPreferences),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final AppSettings _appSettings;

  @override
  void initState() {
    super.initState();
    ref.read(appSettingsProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WidgetRef ref, child) {
        ThemeData theme;
        if (ref.watch(appSettingsProvider).darkMode!) {
          theme = BarnivoreTheme.dark();
        } else {
          theme = BarnivoreTheme.light();
        }

        return MaterialApp(
          title: 'BARNIVORE',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: const SearchFlow(),
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(context, settings),
        );
      },
    );
  }
}
