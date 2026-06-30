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
  static const String githubUrl = 'https://github.com/pudra-soft';

  // Фичи для секции "Почему выбирают нас" (общие для всех)
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
