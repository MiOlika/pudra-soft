import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/app_settings.dart';

/// Переключатели языка и темы в шапке сайта.
class SettingsControls extends StatelessWidget {
  const SettingsControls({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = AppSettingsScope.of(context);
    final strings = AppLocalizations.of(context);
    final color = Theme.of(context).colorScheme.outline;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Tooltip(
          message: strings.otherLanguageTooltip,
          child: TextButton(
            onPressed: settings.toggleLanguage,
            style: TextButton.styleFrom(
              foregroundColor: color,
              minimumSize: const Size(44, 44),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            child: Text(
              strings.otherLanguageLabel,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            settings.isDark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
          ),
          color: color,
          tooltip: settings.isDark
              ? strings.lightThemeTooltip
              : strings.darkThemeTooltip,
          onPressed: settings.toggleTheme,
        ),
      ],
    );
  }
}
