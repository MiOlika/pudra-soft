import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/app_theme.dart';

class AppModel {
  final String id;
  final String title;
  final String subtitle;

  /// Запасная версия на случай, если GitHub недоступен.
  final String version;

  /// Имя репозитория издателя на GitHub, из которого загружаются релизы.
  final String githubRepo;
  final String description;
  final String detailedDescription;

  /// Цвет приложения. Значения для каждой темы заданы в [AppColors].
  final AppAccent accent;

  /// Имя файла логотипа в папке `assets/images/<тема>/`.
  final String logoFile;

  /// Значок на случай, если файла логотипа нет.
  final IconData fallbackIcon;
  final String? videoPath;

  /// Имена файлов в папке `assets/screenshots/<тема>/`.
  final List<String> screenshotFiles;
  final List<String> features;
  final List<String> benefits;
  final List<FaqItem> faqs; // Добавляем FAQ для каждого приложения
  final String category;

  const AppModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.version,
    required this.githubRepo,
    required this.description,
    required this.detailedDescription,
    required this.accent,
    required this.logoFile,
    this.fallbackIcon = Icons.apps,
    this.videoPath,
    this.screenshotFiles = const [],
    required this.features,
    this.benefits = const [],
    this.faqs = const [], // По умолчанию пустой список
    this.category = 'main',
  });

  /// Цвет приложения для текущей темы.
  Color accentColor(BuildContext context) {
    return AppColors.of(context).accent(accent);
  }

  /// Логотип для текущей темы.
  String logoPath(BuildContext context) {
    return AppImages.of(context).image(logoFile);
  }

  /// Скриншоты для текущей темы.
  List<String> screenshots(BuildContext context) {
    final images = AppImages.of(context);
    return screenshotFiles.map(images.screenshot).toList(growable: false);
  }

  /// Страница со всеми релизами приложения на GitHub.
  String get releasesUrl => 'https://github.com/MiOlika/$githubRepo/releases';

  /// Запасная ссылка, если GitHub API недоступен: страница последнего релиза.
  /// Прямая ссылка `latest/download/<файл>` не подходит, потому что в именах
  /// установщиков есть номер версии.
  String get downloadUrl => '$releasesUrl/latest';

  // Фабричный метод для создания DoSka
  factory AppModel.doska(AppLocalizations l) {
    return AppModel(
      id: 'doska',
      title: 'DoSka',
      subtitle: l.doskaSubtitle,
      version: '1.0.3.0',
      githubRepo: 'DoSka',
      description: l.doskaDescription,
      detailedDescription: l.doskaDetails,
      accent: AppAccent.doska,
      logoFile: 'doska_logo.png',
      videoPath: '456239019',
      screenshotFiles: const [
        'doska_1.png',
        'doska_2.png',
        'doska_3.png',
      ],
      features: [
        l.doskaFeature1,
        l.doskaFeature2,
        l.doskaFeature3,
        l.doskaFeature4,
        l.doskaFeature5,
      ],
      benefits: [
        l.doskaBenefit1,
        l.doskaBenefit2,
        l.doskaBenefit3,
        l.doskaBenefit4,
        l.doskaBenefit5,
      ],
      faqs: [
        FaqItem(question: l.doskaFaq1Question, answer: l.doskaFaq1Answer),
        FaqItem(question: l.doskaFaq2Question, answer: l.doskaFaq2Answer),
        FaqItem(question: l.doskaFaq3Question, answer: l.doskaFaq3Answer),
        FaqItem(question: l.doskaFaq4Question, answer: l.doskaFaq4Answer),
      ],
    );
  }

  // Фабричный метод для создания TimeFiller
  factory AppModel.timeFiller(AppLocalizations l) {
    return AppModel(
      id: 'timefiller',
      title: 'Time Filler',
      subtitle: l.timeFillerSubtitle,
      version: '0.3.3.0',
      githubRepo: 'Time-Filler',
      description: l.timeFillerDescription,
      detailedDescription: l.timeFillerDetails,
      accent: AppAccent.timeFiller,
      logoFile: 'timefiller_logo.png',
      videoPath: '456239017',
      screenshotFiles: const [
        'timefiller_1.png',
        'timefiller_2.png',
        'timefiller_3.png',
      ],
      features: [
        l.timeFillerFeature1,
        l.timeFillerFeature2,
        l.timeFillerFeature3,
        l.timeFillerFeature4,
        l.timeFillerFeature5,
      ],
      benefits: [
        l.timeFillerBenefit1,
        l.timeFillerBenefit2,
        l.timeFillerBenefit3,
        l.timeFillerBenefit4,
        l.timeFillerBenefit5,
      ],
      faqs: [
        FaqItem(question: l.timeFillerFaq1Question, answer: l.timeFillerFaq1Answer),
        FaqItem(question: l.timeFillerFaq2Question, answer: l.timeFillerFaq2Answer),
        FaqItem(question: l.timeFillerFaq3Question, answer: l.timeFillerFaq3Answer),
        FaqItem(question: l.timeFillerFaq4Question, answer: l.timeFillerFaq4Answer),
      ],
    );
  }

  // Фабричный метод для создания Clip Ink
  factory AppModel.clipInk(AppLocalizations l) {
    return AppModel(
      id: 'clipink',
      title: 'Clip Ink',
      subtitle: l.clipInkSubtitle,
      version: '1.0.0.0',
      githubRepo: 'Clip-Ink',
      description: l.clipInkDescription,
      detailedDescription: l.clipInkDetails,
      accent: AppAccent.clipInk,
      logoFile: 'clip_ink_logo.png',
      fallbackIcon: Icons.videocam_rounded,
      features: [
        l.clipInkFeature1,
        l.clipInkFeature2,
        l.clipInkFeature3,
        l.clipInkFeature4,
        l.clipInkFeature5,
      ],
      benefits: [
        l.clipInkBenefit1,
        l.clipInkBenefit2,
        l.clipInkBenefit3,
        l.clipInkBenefit4,
        l.clipInkBenefit5,
      ],
      faqs: [
        FaqItem(question: l.clipInkFaq1Question, answer: l.clipInkFaq1Answer),
        FaqItem(question: l.clipInkFaq2Question, answer: l.clipInkFaq2Answer),
        FaqItem(question: l.clipInkFaq3Question, answer: l.clipInkFaq3Answer),
        FaqItem(question: l.clipInkFaq4Question, answer: l.clipInkFaq4Answer),
      ],
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
