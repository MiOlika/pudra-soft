import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Выбранные посетителем язык и тема. Выбор запоминается в браузере.
class AppSettings extends ChangeNotifier {
  AppSettings({
    required Locale locale,
    required ThemeMode themeMode,
    SharedPreferences? preferences,
  })  : _locale = locale,
        _themeMode = themeMode,
        _preferences = preferences;

  static const String _languageKey = 'language';
  static const String _themeKey = 'theme';
  static const String _lightValue = 'light';
  static const String _darkValue = 'dark';
  static const String _russian = 'ru';
  static const String _english = 'en';

  Locale _locale;
  ThemeMode _themeMode;
  final SharedPreferences? _preferences;

  Locale get locale => _locale;
  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;

  /// Читает сохранённый выбор. При первом посещении язык берётся из браузера,
  /// а тема остаётся тёмной. Если хранилище браузера недоступно, сайт работает
  /// без сохранения выбора.
  static Future<AppSettings> load() async {
    SharedPreferences? preferences;
    try {
      preferences = await SharedPreferences.getInstance();
    } catch (_) {
      preferences = null;
    }

    // Статические страницы для поисковиков открывают сайт ссылкой /?lang=en.
    final requested = Uri.base.queryParameters['lang'];
    final isSupported = requested == _russian || requested == _english;
    final languageCode = (isSupported ? requested : null) ??
        preferences?.getString(_languageKey) ??
        PlatformDispatcher.instance.locale.languageCode;
    final theme = preferences?.getString(_themeKey);

    return AppSettings(
      locale: Locale(languageCode == _russian ? _russian : _english),
      themeMode: theme == _lightValue ? ThemeMode.light : ThemeMode.dark,
      preferences: preferences,
    );
  }

  void toggleLanguage() {
    final isRussian = _locale.languageCode == _russian;
    _locale = Locale(isRussian ? _english : _russian);
    _save(_languageKey, _locale.languageCode);
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    _save(_themeKey, isDark ? _darkValue : _lightValue);
    notifyListeners();
  }

  void _save(String key, String value) {
    // Сбой записи не мешает работе: выбор просто не сохранится до следующего раза.
    _preferences?.setString(key, value).catchError((_) => false);
  }
}

/// Даёт виджетам доступ к [AppSettings] и перестраивает их при изменениях.
class AppSettingsScope extends InheritedNotifier<AppSettings> {
  const AppSettingsScope({
    super.key,
    required AppSettings settings,
    required super.child,
  }) : super(notifier: settings);

  static AppSettings of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<AppSettingsScope>();
    assert(scope != null, 'AppSettingsScope не найден');
    return scope!.notifier!;
  }
}
