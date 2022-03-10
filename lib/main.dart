import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:barnivore/amplifyconfiguration.dart';
import 'package:barnivore/data/data_load_service.dart';
import 'package:barnivore/features/home/home_screen.dart';
import 'package:barnivore/features/search_flow/search_flow.dart';
import 'package:barnivore/models/ModelProvider.dart';
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
        dataLoadServiceProvider.overrideWithValue(
          DataLoadService(),
        ),
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

  // loading ui state - initially set to a loading state
  bool _isLoading = true;

  // amplify plugins
  final AmplifyDataStore _dataStorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);

  @override
  void initState() {
    super.initState();
    ref.read(appSettingsProvider.notifier).init();

    // kick off app initialization
    _initializeApp();
  }

  Future<void> _loadData() async {
    final dataLoadService = ref.read(dataLoadServiceProvider);
    await dataLoadService.deleteData();
    await dataLoadService.loadCompanies();
    await dataLoadService.loadBeers();
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    await _configureAmplify();

    // load data
    await _loadData();

    // after configuring Amplify, update loading ui state to loaded state
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _configureAmplify() async {
    try {
      // add Amplify plugins
      await Amplify.addPlugins([_dataStorePlugin]);

      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      print('An error occurred while configuring Amplify: $e');
    }
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
