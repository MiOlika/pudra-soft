import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/generated/app_localizations.dart';
import '../models/app_model.dart';

class AppConstants {
  // Список всех приложений. Чтобы добавить новое: заведите тексты в
  // lib/l10n/app_*.arb, цвет в AppColors и фабричный метод в AppModel.
  static List<AppModel> appsFor(AppLocalizations l) => [
        AppModel.doska(l),
        AppModel.timeFiller(l),
        AppModel.clipInk(l),
      ];

  // Социальные ссылки
  static const String vkUrl = 'https://vk.ru/pudra_soft';
  static const String maxUrl = 'https://max.ru/channel_pudra_soft';
  static const String githubUrl = 'https://github.com/pudra-soft';

  // Фичи для секции "Почему выбирают нас" (общие для всех)

  static List<Map<String, dynamic>> featuresFor(AppLocalizations l) {
    return [
      {
        'icon': Icons.lock_outline,
        'title': l.whyOfflineTitle,
        'description': l.whyOfflineDescription,
      },
      {
        'icon': Icons.flash_on,
        'title': l.whyInstallTitle,
        'description': l.whyInstallDescription,
      },
      {
        'icon': Icons.money_off,
        'title': l.whyFreeTitle,
        'description': l.whyFreeDescription,
      },
      {
        'icon': Icons.shield_outlined,
        'title': l.whyDataTitle,
        'description': l.whyDataDescription,
      },
      {
        'icon': Icons.computer,
        'title': l.whyWindowsTitle,
        'description': l.whyWindowsDescription,
      },
      {
        'icon': Icons.support_agent,
        'title': l.whySupportTitle,
        'description': l.whySupportDescription,
      },
    ];
  }
}

// Вспомогательные функции для работы с ссылками
class LinkLauncher {
  static Future<void> launchUrlString(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
