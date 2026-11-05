import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @supportTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка ВКонтакте'**
  String get supportTooltip;

  /// No description provided for @otherLanguageLabel.
  ///
  /// In ru, this message translates to:
  /// **'EN'**
  String get otherLanguageLabel;

  /// No description provided for @otherLanguageTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Switch to English'**
  String get otherLanguageTooltip;

  /// No description provided for @lightThemeTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Светлая тема'**
  String get lightThemeTooltip;

  /// No description provided for @darkThemeTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Тёмная тема'**
  String get darkThemeTooltip;

  /// No description provided for @heroTitle.
  ///
  /// In ru, this message translates to:
  /// **'Локальное ПО для\nпродуктивной работы'**
  String get heroTitle;

  /// No description provided for @heroSubtitleMobile.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатные приложения для Windows,\nработающие полностью автономно'**
  String get heroSubtitleMobile;

  /// No description provided for @heroSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатные приложения для Windows, которые работают полностью автономно.\nВаши данные — только на вашем компьютере.'**
  String get heroSubtitle;

  /// No description provided for @heroBadgeMobile.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатно • Без подписки'**
  String get heroBadgeMobile;

  /// No description provided for @heroBadge.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатно • Без подписки • Полная автономность'**
  String get heroBadge;

  /// No description provided for @productsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Программные продукты'**
  String get productsTitle;

  /// No description provided for @partnersTitle.
  ///
  /// In ru, this message translates to:
  /// **'Партнеры'**
  String get partnersTitle;

  /// No description provided for @whyUsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Почему выбирают нас'**
  String get whyUsTitle;

  /// No description provided for @whyUsSubtitleMobile.
  ///
  /// In ru, this message translates to:
  /// **'Приложения от Pudra Soft для продуктивной работы\nс полной приватностью'**
  String get whyUsSubtitleMobile;

  /// No description provided for @whyUsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Приложения от Pudra Soft созданы для продуктивной работы\nс полной приватностью ваших данных'**
  String get whyUsSubtitle;

  /// No description provided for @descriptionTitle.
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get descriptionTitle;

  /// No description provided for @galleryTitle.
  ///
  /// In ru, this message translates to:
  /// **'Галерея'**
  String get galleryTitle;

  /// No description provided for @featuresTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ключевые возможности'**
  String get featuresTitle;

  /// No description provided for @benefitsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Преимущества'**
  String get benefitsTitle;

  /// No description provided for @versionsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Версии'**
  String get versionsTitle;

  /// No description provided for @faqTitle.
  ///
  /// In ru, this message translates to:
  /// **'Часто задаваемые вопросы'**
  String get faqTitle;

  /// No description provided for @download.
  ///
  /// In ru, this message translates to:
  /// **'Скачать'**
  String get download;

  /// No description provided for @downloadFree.
  ///
  /// In ru, this message translates to:
  /// **'Скачать бесплатно'**
  String get downloadFree;

  /// No description provided for @versionForWindows.
  ///
  /// In ru, this message translates to:
  /// **'Версия {version} для Windows'**
  String versionForWindows(String version);

  /// No description provided for @version.
  ///
  /// In ru, this message translates to:
  /// **'Версия {version}'**
  String version(String version);

  /// No description provided for @loadingVersions.
  ///
  /// In ru, this message translates to:
  /// **'Загружаем список версий…'**
  String get loadingVersions;

  /// No description provided for @versionsError.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось получить список версий. Вы можете скачать версию {version} кнопкой на этой странице или открыть все версии на GitHub.'**
  String versionsError(String version);

  /// No description provided for @noVersions.
  ///
  /// In ru, this message translates to:
  /// **'Опубликованных версий пока нет.'**
  String get noVersions;

  /// No description provided for @latestBadge.
  ///
  /// In ru, this message translates to:
  /// **'Последняя'**
  String get latestBadge;

  /// No description provided for @prereleaseBadge.
  ///
  /// In ru, this message translates to:
  /// **'Предварительная'**
  String get prereleaseBadge;

  /// No description provided for @whatsNew.
  ///
  /// In ru, this message translates to:
  /// **'Что нового'**
  String get whatsNew;

  /// No description provided for @openRelease.
  ///
  /// In ru, this message translates to:
  /// **'Открыть'**
  String get openRelease;

  /// No description provided for @fileSize.
  ///
  /// In ru, this message translates to:
  /// **'{size} МБ'**
  String fileSize(double size);

  /// No description provided for @downloadWithSize.
  ///
  /// In ru, this message translates to:
  /// **'Скачать, {size}'**
  String downloadWithSize(String size);

  /// No description provided for @releaseDate.
  ///
  /// In ru, this message translates to:
  /// **'{date}'**
  String releaseDate(DateTime date);

  /// No description provided for @collapse.
  ///
  /// In ru, this message translates to:
  /// **'Свернуть'**
  String get collapse;

  /// No description provided for @showAllVersions.
  ///
  /// In ru, this message translates to:
  /// **'Показать все версии ({count})'**
  String showAllVersions(int count);

  /// No description provided for @allReleasesOnGithub.
  ///
  /// In ru, this message translates to:
  /// **'Все релизы на GitHub'**
  String get allReleasesOnGithub;

  /// No description provided for @vkGroup.
  ///
  /// In ru, this message translates to:
  /// **'Группа ВКонтакте'**
  String get vkGroup;

  /// No description provided for @maxChannel.
  ///
  /// In ru, this message translates to:
  /// **'Канал в MAX'**
  String get maxChannel;

  /// No description provided for @copyright.
  ///
  /// In ru, this message translates to:
  /// **'© 2026 Pudra Soft. Все права защищены.'**
  String get copyright;

  /// No description provided for @footerNote.
  ///
  /// In ru, this message translates to:
  /// **'Приложения работают полностью локально. Ваши данные — только на вашем компьютере.'**
  String get footerNote;

  /// No description provided for @whyOfflineTitle.
  ///
  /// In ru, this message translates to:
  /// **'Полная автономность'**
  String get whyOfflineTitle;

  /// No description provided for @whyOfflineDescription.
  ///
  /// In ru, this message translates to:
  /// **'Работает без интернета. Все данные хранятся только на вашем компьютере.'**
  String get whyOfflineDescription;

  /// No description provided for @whyInstallTitle.
  ///
  /// In ru, this message translates to:
  /// **'Мгновенная установка'**
  String get whyInstallTitle;

  /// No description provided for @whyInstallDescription.
  ///
  /// In ru, this message translates to:
  /// **'Установка занимает 1 минуту из одного файла без сложных настроек.'**
  String get whyInstallDescription;

  /// No description provided for @whyFreeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Абсолютно бесплатно'**
  String get whyFreeTitle;

  /// No description provided for @whyFreeDescription.
  ///
  /// In ru, this message translates to:
  /// **'Никаких подписок и скрытых платежей. Скачал и пользуйся.'**
  String get whyFreeDescription;

  /// No description provided for @whyDataTitle.
  ///
  /// In ru, this message translates to:
  /// **'Полный контроль данных'**
  String get whyDataTitle;

  /// No description provided for @whyDataDescription.
  ///
  /// In ru, this message translates to:
  /// **'Никаких облачных сервисов. Ваши данные под вашим контролем.'**
  String get whyDataDescription;

  /// No description provided for @whyWindowsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Для Windows 10/11'**
  String get whyWindowsTitle;

  /// No description provided for @whyWindowsDescription.
  ///
  /// In ru, this message translates to:
  /// **'Полная совместимость с современными версиями Windows.'**
  String get whyWindowsDescription;

  /// No description provided for @whySupportTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатная поддержка'**
  String get whySupportTitle;

  /// No description provided for @whySupportDescription.
  ///
  /// In ru, this message translates to:
  /// **'Техподдержка через официальную группу ВКонтакте.'**
  String get whySupportDescription;

  /// No description provided for @partnerScanSoftName.
  ///
  /// In ru, this message translates to:
  /// **'Скан Софт'**
  String get partnerScanSoftName;

  /// No description provided for @partnerScanSoftDescription.
  ///
  /// In ru, this message translates to:
  /// **'Дистрибьютор нашего программного обеспечения'**
  String get partnerScanSoftDescription;

  /// No description provided for @doskaSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Конструктор проектов'**
  String get doskaSubtitle;

  /// No description provided for @doskaDescription.
  ///
  /// In ru, this message translates to:
  /// **'Персональный конструктор проектов для Windows'**
  String get doskaDescription;

  /// No description provided for @doskaDetails.
  ///
  /// In ru, this message translates to:
  /// **'DoSka — это персональный конструктор проектов для Windows. Простое и мощное приложение для визуального планирования, которое поможет структурировать любую задачу: от бизнес-процесса до учебного проекта.\n\nПриложение работает полностью локально, без подключения к интернету и облачным сервисам, гарантируя, что все данные останутся только на вашем компьютере.\n\nРешение позволяет собирать пользовательские истории, визуализировать процессы и техкарты, а также декомпозировать задачи любого уровня сложности.'**
  String get doskaDetails;

  /// No description provided for @doskaFeature1.
  ///
  /// In ru, this message translates to:
  /// **'📋 Иерархические списки задач (WBS)'**
  String get doskaFeature1;

  /// No description provided for @doskaFeature2.
  ///
  /// In ru, this message translates to:
  /// **'📝 Сбор пользовательских историй'**
  String get doskaFeature2;

  /// No description provided for @doskaFeature3.
  ///
  /// In ru, this message translates to:
  /// **'🔗 Связи между заметками'**
  String get doskaFeature3;

  /// No description provided for @doskaFeature4.
  ///
  /// In ru, this message translates to:
  /// **'✅ Чек-листы'**
  String get doskaFeature4;

  /// No description provided for @doskaFeature5.
  ///
  /// In ru, this message translates to:
  /// **'🎨 Управление временем выполнения'**
  String get doskaFeature5;

  /// No description provided for @doskaBenefit1.
  ///
  /// In ru, this message translates to:
  /// **'Полная автономность (без интернета и облаков)'**
  String get doskaBenefit1;

  /// No description provided for @doskaBenefit2.
  ///
  /// In ru, this message translates to:
  /// **'Мгновенная установка из одного файла'**
  String get doskaBenefit2;

  /// No description provided for @doskaBenefit3.
  ///
  /// In ru, this message translates to:
  /// **'Визуальный конструктор для любых проектов'**
  String get doskaBenefit3;

  /// No description provided for @doskaBenefit4.
  ///
  /// In ru, this message translates to:
  /// **'Все данные под вашим полным контролем'**
  String get doskaBenefit4;

  /// No description provided for @doskaBenefit5.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатно для частного использования'**
  String get doskaBenefit5;

  /// No description provided for @doskaFaq1Question.
  ///
  /// In ru, this message translates to:
  /// **'Как работает DoSka?'**
  String get doskaFaq1Question;

  /// No description provided for @doskaFaq1Answer.
  ///
  /// In ru, this message translates to:
  /// **'Это локальный конструктор проектов для Windows. Прототипом послужила магнитная доска с цветными стикерами (заметками). Здесь можно создать несколько проектов с досками. Заметки можно связывать между собой и запускать таймеры для контроля времени.'**
  String get doskaFaq1Answer;

  /// No description provided for @doskaFaq2Question.
  ///
  /// In ru, this message translates to:
  /// **'Сколько проектов можно создать?'**
  String get doskaFaq2Question;

  /// No description provided for @doskaFaq2Answer.
  ///
  /// In ru, this message translates to:
  /// **'Можно создать до 20 проектов. В каждом проекте - до 20 досок, на каждой доске - до 100 заметок.'**
  String get doskaFaq2Answer;

  /// No description provided for @doskaFaq3Question.
  ///
  /// In ru, this message translates to:
  /// **'Можно ли экспортировать проект?'**
  String get doskaFaq3Question;

  /// No description provided for @doskaFaq3Answer.
  ///
  /// In ru, this message translates to:
  /// **'На данный момент функция экспорта проектов находится в разработке. Это гарантирует, что никто не изменит ваши данные без вашего ведома.'**
  String get doskaFaq3Answer;

  /// No description provided for @doskaFaq4Question.
  ///
  /// In ru, this message translates to:
  /// **'Почему Windows показывает предупреждение при установке?'**
  String get doskaFaq4Question;

  /// No description provided for @doskaFaq4Answer.
  ///
  /// In ru, this message translates to:
  /// **'Официальное одобрение от Microsoft ожидается, но из-за санкционных ограничений процесс затягивается. Это не влияет на безопасность — приложение не собирает данные и полностью безопасно.'**
  String get doskaFaq4Answer;

  /// No description provided for @timeFillerSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Планировщик для команд'**
  String get timeFillerSubtitle;

  /// No description provided for @timeFillerDescription.
  ///
  /// In ru, this message translates to:
  /// **'Локальный планировщик для небольших команд'**
  String get timeFillerDescription;

  /// No description provided for @timeFillerDetails.
  ///
  /// In ru, this message translates to:
  /// **'TimeFiller — это локальный планировщик для Windows, созданный для небольших команд. Приложение работает полностью автономно, без подключения к интернету и облачным сервисам, гарантируя, что все данные останутся только на вашем компьютере.\n\nРешение позволяет управлять отпусками сотрудников, вести запись клиентов, планировать встречи и регулярные события, а также организовывать работу по спринтам.'**
  String get timeFillerDetails;

  /// No description provided for @timeFillerFeature1.
  ///
  /// In ru, this message translates to:
  /// **'📅 Графики смен (2 через 2, 5/2)'**
  String get timeFillerFeature1;

  /// No description provided for @timeFillerFeature2.
  ///
  /// In ru, this message translates to:
  /// **'🏖️ Управление отпусками сотрудников'**
  String get timeFillerFeature2;

  /// No description provided for @timeFillerFeature3.
  ///
  /// In ru, this message translates to:
  /// **'👥 Запись клиентов и встреч'**
  String get timeFillerFeature3;

  /// No description provided for @timeFillerFeature4.
  ///
  /// In ru, this message translates to:
  /// **'🔄 Поддержка спринтов'**
  String get timeFillerFeature4;

  /// No description provided for @timeFillerFeature5.
  ///
  /// In ru, this message translates to:
  /// **'🎯 Фильтрация по категориям'**
  String get timeFillerFeature5;

  /// No description provided for @timeFillerBenefit1.
  ///
  /// In ru, this message translates to:
  /// **'Полная автономность (без интернета и облаков)'**
  String get timeFillerBenefit1;

  /// No description provided for @timeFillerBenefit2.
  ///
  /// In ru, this message translates to:
  /// **'Мгновенная установка из одного файла'**
  String get timeFillerBenefit2;

  /// No description provided for @timeFillerBenefit3.
  ///
  /// In ru, this message translates to:
  /// **'Визуальный календарь для всех сценариев'**
  String get timeFillerBenefit3;

  /// No description provided for @timeFillerBenefit4.
  ///
  /// In ru, this message translates to:
  /// **'Настройка прозрачности интерфейса'**
  String get timeFillerBenefit4;

  /// No description provided for @timeFillerBenefit5.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатно для небольших команд'**
  String get timeFillerBenefit5;

  /// No description provided for @timeFillerFaq1Question.
  ///
  /// In ru, this message translates to:
  /// **'Как работает TimeFiller?'**
  String get timeFillerFaq1Question;

  /// No description provided for @timeFillerFaq1Answer.
  ///
  /// In ru, this message translates to:
  /// **'Это локальный планировщик для Windows. Вы создаёте диапазоны с категориями, и они отображаются в календаре.'**
  String get timeFillerFaq1Answer;

  /// No description provided for @timeFillerFaq2Question.
  ///
  /// In ru, this message translates to:
  /// **'Можно ли создавать графики 2 через 2?'**
  String get timeFillerFaq2Question;

  /// No description provided for @timeFillerFaq2Answer.
  ///
  /// In ru, this message translates to:
  /// **'Да, в приложении есть быстрая настройка смен с помощью повторов диапазонов. Вы можете создать любой график работы.'**
  String get timeFillerFaq2Answer;

  /// No description provided for @timeFillerFaq3Question.
  ///
  /// In ru, this message translates to:
  /// **'Как вести учёт отпусков?'**
  String get timeFillerFaq3Question;

  /// No description provided for @timeFillerFaq3Answer.
  ///
  /// In ru, this message translates to:
  /// **'Создайте диапазон с категорией \"Отпуск\" для нужного сотрудника. Все отпуска будут отображаться в календаре и их можно фильтровать.'**
  String get timeFillerFaq3Answer;

  /// No description provided for @timeFillerFaq4Question.
  ///
  /// In ru, this message translates to:
  /// **'Поддерживается ли интеграция с другими программами?'**
  String get timeFillerFaq4Question;

  /// No description provided for @timeFillerFaq4Answer.
  ///
  /// In ru, this message translates to:
  /// **'Нет, TimeFiller — полностью самостоятельное приложение. Оно не требует интеграций и работает локально.'**
  String get timeFillerFaq4Answer;

  /// No description provided for @clipInkSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Запись экрана'**
  String get clipInkSubtitle;

  /// No description provided for @clipInkDescription.
  ///
  /// In ru, this message translates to:
  /// **'Лёгкая программа для записи экрана в Windows'**
  String get clipInkDescription;

  /// No description provided for @clipInkDetails.
  ///
  /// In ru, this message translates to:
  /// **'Clip Ink — лёгкая программа для записи экрана в Windows. Вы двигаете и растягиваете рамку над нужным местом, нажимаете «Начать запись» и получаете обычный MP4, который открывается в любом плеере и загружается на любые площадки. Рамка в видео не попадает: пишется только то, что внутри неё.\n\nЗаписать можно произвольную область, весь экран или окно приложения, со звуком микрофона, системы или сразу обоих источников. Во время записи можно рисовать и добавлять подписи.'**
  String get clipInkDetails;

  /// No description provided for @clipInkFeature1.
  ///
  /// In ru, this message translates to:
  /// **'🖼️ Рамка, весь экран или окно'**
  String get clipInkFeature1;

  /// No description provided for @clipInkFeature2.
  ///
  /// In ru, this message translates to:
  /// **'🎙️ Микрофон и системный звук'**
  String get clipInkFeature2;

  /// No description provided for @clipInkFeature3.
  ///
  /// In ru, this message translates to:
  /// **'✏️ Рисование и подписи'**
  String get clipInkFeature3;

  /// No description provided for @clipInkFeature4.
  ///
  /// In ru, this message translates to:
  /// **'⏸️ Пауза без рассинхронизации'**
  String get clipInkFeature4;

  /// No description provided for @clipInkFeature5.
  ///
  /// In ru, this message translates to:
  /// **'🎞️ 15, 24, 30 или 60 кадров/с'**
  String get clipInkFeature5;

  /// No description provided for @clipInkBenefit1.
  ///
  /// In ru, this message translates to:
  /// **'Обычный MP4 (H.264 + AAC) для любых плееров и площадок'**
  String get clipInkBenefit1;

  /// No description provided for @clipInkBenefit2.
  ///
  /// In ru, this message translates to:
  /// **'Записанное сохранится при аварийном закрытии программы'**
  String get clipInkBenefit2;

  /// No description provided for @clipInkBenefit3.
  ///
  /// In ru, this message translates to:
  /// **'Контроль свободного места на диске'**
  String get clipInkBenefit3;

  /// No description provided for @clipInkBenefit4.
  ///
  /// In ru, this message translates to:
  /// **'Интерфейс на русском и английском'**
  String get clipInkBenefit4;

  /// No description provided for @clipInkBenefit5.
  ///
  /// In ru, this message translates to:
  /// **'Работает на Windows 10 и 11 (64-бит)'**
  String get clipInkBenefit5;

  /// No description provided for @clipInkFaq1Question.
  ///
  /// In ru, this message translates to:
  /// **'Какая максимальная длина записи?'**
  String get clipInkFaq1Question;

  /// No description provided for @clipInkFaq1Answer.
  ///
  /// In ru, this message translates to:
  /// **'Один ролик — не дольше 20 минут. При достижении лимита запись сохраняется автоматически, и можно сразу начать следующую.'**
  String get clipInkFaq1Answer;

  /// No description provided for @clipInkFaq2Question.
  ///
  /// In ru, this message translates to:
  /// **'Можно ли включать и выключать звук во время записи?'**
  String get clipInkFaq2Question;

  /// No description provided for @clipInkFaq2Answer.
  ///
  /// In ru, this message translates to:
  /// **'Да, микрофон и звук с монитора можно отключать и включать прямо во время записи, не останавливая её.'**
  String get clipInkFaq2Answer;

  /// No description provided for @clipInkFaq3Question.
  ///
  /// In ru, this message translates to:
  /// **'Почему часть видео записывается чёрной?'**
  String get clipInkFaq3Question;

  /// No description provided for @clipInkFaq3Answer.
  ///
  /// In ru, this message translates to:
  /// **'Содержимое с аппаратным ускорением (часть игр, видео с защитой DRM) может записываться чёрным.'**
  String get clipInkFaq3Answer;

  /// No description provided for @clipInkFaq4Question.
  ///
  /// In ru, this message translates to:
  /// **'Есть ли эхоподавление?'**
  String get clipInkFaq4Question;

  /// No description provided for @clipInkFaq4Answer.
  ///
  /// In ru, this message translates to:
  /// **'Нет. Если пишете и микрофон, и звук с монитора, используйте наушники.'**
  String get clipInkFaq4Answer;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
