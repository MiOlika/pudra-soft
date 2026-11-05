import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pudra_soft/l10n/generated/app_localizations.dart';
import 'package:pudra_soft/utils/app_settings.dart';
import 'package:pudra_soft/utils/app_theme.dart';
import 'package:pudra_soft/widgets/settings_controls.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('переключает язык и тему', (tester) async {
    final settings = AppSettings(
      locale: const Locale('ru'),
      themeMode: ThemeMode.dark,
    );

    await tester.pumpWidget(
      AppSettingsScope(
        settings: settings,
        child: Builder(
          builder: (context) {
            final current = AppSettingsScope.of(context);
            return MaterialApp(
              locale: current.locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              home: const Scaffold(body: SettingsControls()),
            );
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('EN'));
    await tester.pumpAndSettle();
    expect(settings.locale.languageCode, 'en');
    expect(find.text('RU'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.light_mode_outlined));
    await tester.pumpAndSettle();
    expect(settings.themeMode, ThemeMode.light);
    expect(find.byIcon(Icons.dark_mode_outlined), findsOneWidget);
  });

  test('запоминает выбор между запусками', () async {
    SharedPreferences.setMockInitialValues({});
    final first = await AppSettings.load();
    expect(first.themeMode, ThemeMode.dark);

    first.toggleTheme();
    if (first.locale.languageCode != 'ru') first.toggleLanguage();

    final second = await AppSettings.load();
    expect(second.themeMode, ThemeMode.light);
    expect(second.locale.languageCode, 'ru');
  });

  test('картинки зависят от темы', () {
    final light = AppTheme.lightTheme.extension<AppImages>()!;
    final dark = AppTheme.darkTheme.extension<AppImages>()!;

    expect(light.image('banner.jpg'), 'assets/images/light/banner.jpg');
    expect(dark.screenshot('a.png'), 'assets/screenshots/dark/a.png');
  });

  test('переводы зависят от языка', () {
    expect(lookupAppLocalizations(const Locale('ru')).download, 'Скачать');
    expect(lookupAppLocalizations(const Locale('en')).download, 'Download');
  });
}
