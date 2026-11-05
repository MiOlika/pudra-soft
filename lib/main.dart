import 'package:flutter/material.dart';
import 'package:pudra_soft/l10n/generated/app_localizations.dart';
import 'package:pudra_soft/utils/app_settings.dart';
import 'package:pudra_soft/utils/app_theme.dart';

import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settings = await AppSettings.load();
  runApp(MyApp(settings: settings));
}

class MyApp extends StatelessWidget {
  final AppSettings settings;

  const MyApp({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return AppSettingsScope(
      settings: settings,
      child: Builder(
        builder: (context) {
          final current = AppSettingsScope.of(context);
          return MaterialApp(
            title: 'Pudra Soft',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: current.themeMode,
            locale: current.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: const HomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
