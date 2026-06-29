import 'dart:ui';

import 'package:url_launcher/url_launcher.dart';

class AppConstants {
  // Ссылки на GitHub релизы
  static const String doskaDownloadUrl =
      'https://github.com/MiOlika/DoSka/releases/download/0.1.6.0/DoSka_0.1.6.0.msi';
  static const String timeFillerDownloadUrl =
      'https://github.com/MiOlika/Time-Filler/releases/download/0.3.3.0/Time_Filler_0.3.3.0.msi';

  // Социальные ссылки
  static const String vkUrl = 'https://vk.ru/pudra_soft';

  // Названия приложений
  static const String doskaTitle = 'DoSka';
  static const String timeFillerTitle = 'TimeFiller';

  // Версии
  static const String doskaVersion = '0.1.6.0';
  static const String timeFillerVersion = '0.3.3.0';

  // Цвета
  static const Color doskaColor = Color(0xFF6C63FF);
  static const Color timeFillerColor = Color(0xFF00B894);

  // Описания
  static const String doskaDescription =
      'Персональный конструктор проектов для Windows. '
      'Визуальное планирование, WBS, User Story и декомпозиция задач.';

  static const String timeFillerDescription =
      'Локальный планировщик для Windows. '
      'Управление отпусками, запись клиентов, планирование встреч и графики смен.';

  // Списки функций
  static const List<String> doskaFeatures = [
    '📋 Иерархические списки задач (WBS)',
    '📝 Сбор пользовательских историй',
    '🔗 Связи между заметками',
    '✅ Чек-листы',
    '🎨 До 15 досок с цветовой сортировкой',
  ];

  static const List<String> timeFillerFeatures = [
    '📅 Графики смен (2 через 2, 5/2)',
    '🏖️ Управление отпусками сотрудников',
    '👥 Запись клиентов и встреч',
    '🔄 Поддержка спринтов',
    '🎯 Фильтрация по категориям',
  ];

  // FAQ
  static const List<Map<String, String>> faqs = [
    {
      'q': 'Как работает DoSka?',
      'a':
          'Это локальный конструктор проектов для Windows. Вы создаёте проекты, внутри них доски с заметками, связываете их между собой — и получаете визуальную структуру любой задачи.',
    },
    {
      'q': 'Как работает TimeFiller?',
      'a':
          'Это локальный планировщик для Windows. Вы создаёте диапазоны с категориями, и они отображаются в календаре. Поддерживаются смены, отпуска и встречи.',
    },
    {
      'q': 'На каких устройствах работают приложения?',
      'a': 'На любом компьютере с Windows 10 или 11.',
    },
    {
      'q': 'Нужен ли интернет для работы?',
      'a':
          'Нет, приложения работают полностью автономно. Интернет требуется только для скачивания.',
    },
    {
      'q': 'Бесплатно ли это?',
      'a':
          'Да, оба приложения абсолютно бесплатны для частного использования. Никаких подписок.',
    },
    {
      'q': 'Как получить поддержку?',
      'a': 'Через официальную группу ВКонтакте: https://vk.ru/pudra_soft',
    },
  ];

  // Фичи для секции "Почему выбирают нас"
  static const List<Map<String, String>> features = [
    {
      'icon': '🔒',
      'title': 'Полная автономность',
      'description':
          'Работает без интернета. Все данные хранятся только на вашем компьютере.',
    },
    {
      'icon': '⚡',
      'title': 'Мгновенная установка',
      'description':
          'Установка занимает 1 минуту из одного файла без сложных настроек.',
    },
    {
      'icon': '💰',
      'title': 'Абсолютно бесплатно',
      'description': 'Никаких подписок и скрытых платежей. Скачал и пользуйся.',
    },
    {
      'icon': '🛡️',
      'title': 'Полный контроль данных',
      'description':
          'Никаких облачных сервисов. Ваши данные под вашим контролем.',
    },
    {
      'icon': '💻',
      'title': 'Для Windows 10/11',
      'description': 'Полная совместимость с современными версиями Windows.',
    },
    {
      'icon': '📞',
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
