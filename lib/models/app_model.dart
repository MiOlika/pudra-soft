import 'package:flutter/material.dart';

class AppModel {
  final String id;
  final String title;
  final String subtitle;
  final String version;
  final String description;
  final String detailedDescription;
  final String downloadUrl;
  final Color primaryColor;
  final String logoPath;
  final String? videoPath;
  final List<String> screenshots;
  final List<String> features;
  final List<String> benefits;
  final List<FaqItem> faqs; // Добавляем FAQ для каждого приложения
  final String category;

  const AppModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.version,
    required this.description,
    required this.detailedDescription,
    required this.downloadUrl,
    required this.primaryColor,
    required this.logoPath,
    this.videoPath,
    this.screenshots = const [],
    required this.features,
    this.benefits = const [],
    this.faqs = const [], // По умолчанию пустой список
    this.category = 'main',
  });

  // Фабричный метод для создания DoSka
  factory AppModel.doska() {
    return const AppModel(
      id: 'doska',
      title: 'DoSka',
      subtitle: 'Конструктор проектов',
      version: '0.1.6.0',
      description: 'Персональный конструктор проектов для Windows',
      detailedDescription: '''
DoSka — это персональный конструктор проектов для Windows. Простое и мощное приложение 
для визуального планирования, которое поможет структурировать любую задачу: 
от бизнес-процесса до учебного проекта.

Приложение работает полностью локально, без подключения к интернету и облачным сервисам, 
гарантируя, что все данные останутся только на вашем компьютере.

Решение позволяет собирать пользовательские истории, визуализировать процессы и техкарты, 
а также декомпозировать задачи любого уровня сложности.
''',
      downloadUrl:
          'https://github.com/MiOlika/DoSka/releases/download/0.1.6.0/DoSka_0.1.6.0.msi',
      primaryColor: Color(0xFFBF7DC4),
      logoPath: 'assets/images/doska_logo.png',
      videoPath: 'assets/videos/doska_demo.mp4',
      screenshots: [
        'assets/screenshots/doska_1.png',
        'assets/screenshots/doska_2.png',
        'assets/screenshots/doska_3.png',
      ],
      features: [
        '📋 Иерархические списки задач (WBS)',
        '📝 Сбор пользовательских историй',
        '🔗 Связи между заметками',
        '✅ Чек-листы',
        '🎨 До 15 досок с цветовой сортировкой',
      ],
      benefits: [
        'Полная автономность (без интернета и облаков)',
        'Мгновенная установка из одного файла',
        'Визуальный конструктор для любых проектов',
        'Все данные под вашим полным контролем',
        'Бесплатно для частного использования',
      ],
      faqs: [
        FaqItem(
          question: 'Как работает DoSka?',
          answer:
              'Это локальный конструктор проектов для Windows. Вы создаёте проекты, внутри них доски с заметками, связываете их между собой — и получаете визуальную структуру любой задачи.',
        ),
        FaqItem(
          question: 'Сколько проектов можно создать?',
          answer:
              'Количество проектов не ограничено. В каждом проекте можно создать до 15 досок, на каждой доске до 100 заметок.',
        ),
        FaqItem(
          question: 'Можно ли экспортировать проект?',
          answer:
              'На данный момент функция экспорта проектов в разработке. Это гарантирует, что никто не изменит ваши данные без вашего ведома.',
        ),
        FaqItem(
          question: 'Почему Windows показывает предупреждение при установке?',
          answer:
              'Приложение имеет самоподписанный сертификат. Официальный апрув от Microsoft ожидается, но из-за санкционных ограничений процесс затягивается. Это не влияет на безопасность — приложение не собирает данные и полностью безопасно.',
        ),
      ],
    );
  }

  // Фабричный метод для создания TimeFiller
  factory AppModel.timeFiller() {
    return const AppModel(
      id: 'timefiller',
      title: 'TimeFiller',
      subtitle: 'Планировщик для команд',
      version: '0.3.3.0',
      description: 'Локальный планировщик для небольших команд',
      detailedDescription: '''
TimeFiller — это локальный планировщик для Windows, созданный для небольших команд. 
Приложение работает полностью автономно, без подключения к интернету и облачным сервисам, 
гарантируя, что все данные останутся только на вашем компьютере.

Решение позволяет управлять отпусками сотрудников, вести запись клиентов, 
планировать встречи и регулярные события, а также организовывать работу по спринтам.
''',
      downloadUrl:
          'https://github.com/MiOlika/Time-Filler/releases/download/0.3.3.0/Time_Filler_0.3.3.0.msi',
      primaryColor: Color(0xFF00B894),
      logoPath: 'assets/images/timefiller_logo.png',
      videoPath: 'assets/videos/timefiller_demo.mp4',
      screenshots: [
        'assets/screenshots/timefiller_1.png',
        'assets/screenshots/timefiller_2.png',
        'assets/screenshots/timefiller_3.png',
      ],
      features: [
        '📅 Графики смен (2 через 2, 5/2)',
        '🏖️ Управление отпусками сотрудников',
        '👥 Запись клиентов и встреч',
        '🔄 Поддержка спринтов',
        '🎯 Фильтрация по категориям',
      ],
      benefits: [
        'Полная автономность (без интернета и облаков)',
        'Мгновенная установка из одного файла',
        'Визуальный календарь для всех сценариев',
        'Настройка прозрачности интерфейса',
        'Бесплатно для небольших команд',
      ],
      faqs: [
        FaqItem(
          question: 'Как работает TimeFiller?',
          answer:
              'Это локальный планировщик для Windows. Вы создаёте диапазоны с категориями, и они отображаются в календаре.',
        ),
        FaqItem(
          question: 'Можно ли создавать графики 2 через 2?',
          answer:
              'Да, в приложении есть быстрая настройка смен с помощью повторов диапазонов. Вы можете создать любой график работы.',
        ),
        FaqItem(
          question: 'Как вести учёт отпусков?',
          answer:
              'Создайте диапазон с категорией "Отпуск" для нужного сотрудника. Все отпуска будут отображаться в календаре и их можно фильтровать.',
        ),
        FaqItem(
          question: 'Поддерживается ли интеграция с другими программами?',
          answer:
              'Нет, TimeFiller — полностью самостоятельное приложение. Оно не требует интеграций и работает локально.',
        ),
      ],
    );
  }

  // Метод для добавления нового приложения
  factory AppModel.custom({
    required String id,
    required String title,
    required String subtitle,
    required String version,
    required String description,
    required String detailedDescription,
    required String downloadUrl,
    required Color primaryColor,
    required String logoPath,
    String? videoPath,
    List<String> screenshots = const [],
    required List<String> features,
    List<String> benefits = const [],
    List<FaqItem> faqs = const [],
    String category = 'main',
  }) {
    return AppModel(
      id: id,
      title: title,
      subtitle: subtitle,
      version: version,
      description: description,
      detailedDescription: detailedDescription,
      downloadUrl: downloadUrl,
      primaryColor: primaryColor,
      logoPath: logoPath,
      videoPath: videoPath,
      screenshots: screenshots,
      features: features,
      benefits: benefits,
      faqs: faqs,
      category: category,
    );
  }
}

// Модель для FAQ
class FaqItem {
  final String question;
  final String answer;

  const FaqItem({
    required this.question,
    required this.answer,
  });
}
