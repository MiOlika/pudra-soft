import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/app_model.dart';

class AppConstants {
  // Список всех приложений
  static final List<AppModel> allApps = [
    AppModel.doska(),
    AppModel.timeFiller(),
    // Добавляйте новые приложения сюда:
    // AppModel.custom(
    //   id: 'newapp',
    //   title: 'NewApp',
    //   subtitle: 'Description',
    //   version: '1.0.0',
    //   description: 'Описание приложения',
    //   detailedDescription: 'Подробное описание...',
    //   downloadUrl: 'https://github.com/...',
    //   primaryColor: Color(0xFFFF6B6B),
    //   logoPath: 'assets/images/newapp_logo.png',
    //   features: ['Feature 1', 'Feature 2'],
    //   faqs: [
    //     FaqItem(
    //       question: 'Вопрос 1?',
    //       answer: 'Ответ 1',
    //     ),
    //   ],
    // ),
  ];

  // Социальные ссылки
  static const String vkUrl = 'https://vk.ru/pudra_soft';
  static const String maxUrl = 'https://max.ru/channel_pudra_soft';
  static const String githubUrl = 'https://github.com/pudra-soft';

  // Фичи для секции "Почему выбирают нас" (общие для всех)

  static final List<Map<String, dynamic>> features = [
    {
      'icon': Icons.lock_outline, // 🔒
      'title': 'Полная автономность',
      'description':
          'Работает без интернета. Все данные хранятся только на вашем компьютере.',
    },
    const {
      'icon': Icons.flash_on, // ⚡
      'title': 'Мгновенная установка',
      'description':
          'Установка занимает 1 минуту из одного файла без сложных настроек.',
    },
    const {
      'icon': Icons.money_off, // 💰 (или Icons.attach_money)
      'title': 'Абсолютно бесплатно',
      'description': 'Никаких подписок и скрытых платежей. Скачал и пользуйся.',
    },
    const {
      'icon': Icons.shield_outlined, // 🛡️
      'title': 'Полный контроль данных',
      'description':
          'Никаких облачных сервисов. Ваши данные под вашим контролем.',
    },
    const {
      'icon': Icons.computer, // 💻
      'title': 'Для Windows 10/11',
      'description': 'Полная совместимость с современными версиями Windows.',
    },
    const {
      'icon': Icons.support_agent, // 📞 (или Icons.contact_support)
      'title': 'Бесплатная поддержка',
      'description': 'Техподдержка через официальную группу ВКонтакте.',
    },
  ];
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
