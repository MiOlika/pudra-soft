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

  /// No description provided for @heroSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатные приложения для Windows, которые работают полностью автономно. Ваши данные — только на вашем компьютере.'**
  String get heroSubtitle;

  /// No description provided for @heroBadge.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатно • Без подписки • Полная автономность'**
  String get heroBadge;

  /// No description provided for @whyUsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Приложения от Pudra Soft созданы для продуктивной работы с полной приватностью ваших данных.'**
  String get whyUsSubtitle;

  /// No description provided for @descriptionTitle.
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get descriptionTitle;

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
  /// **'Иерархические списки задач (WBS)'**
  String get doskaFeature1;

  /// No description provided for @doskaFeature2.
  ///
  /// In ru, this message translates to:
  /// **'Сбор пользовательских историй'**
  String get doskaFeature2;

  /// No description provided for @doskaFeature3.
  ///
  /// In ru, this message translates to:
  /// **'Связи между заметками'**
  String get doskaFeature3;

  /// No description provided for @doskaFeature4.
  ///
  /// In ru, this message translates to:
  /// **'Чек-листы'**
  String get doskaFeature4;

  /// No description provided for @doskaFeature5.
  ///
  /// In ru, this message translates to:
  /// **'Управление временем выполнения'**
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
  /// **'Графики смен (2 через 2, 5/2)'**
  String get timeFillerFeature1;

  /// No description provided for @timeFillerFeature2.
  ///
  /// In ru, this message translates to:
  /// **'Управление отпусками сотрудников'**
  String get timeFillerFeature2;

  /// No description provided for @timeFillerFeature3.
  ///
  /// In ru, this message translates to:
  /// **'Запись клиентов и встреч'**
  String get timeFillerFeature3;

  /// No description provided for @timeFillerFeature4.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка спринтов'**
  String get timeFillerFeature4;

  /// No description provided for @timeFillerFeature5.
  ///
  /// In ru, this message translates to:
  /// **'Фильтрация по категориям'**
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
  /// **'Рамка, весь экран или окно'**
  String get clipInkFeature1;

  /// No description provided for @clipInkFeature2.
  ///
  /// In ru, this message translates to:
  /// **'Микрофон и системный звук'**
  String get clipInkFeature2;

  /// No description provided for @clipInkFeature3.
  ///
  /// In ru, this message translates to:
  /// **'Рисование и подписи'**
  String get clipInkFeature3;

  /// No description provided for @clipInkFeature4.
  ///
  /// In ru, this message translates to:
  /// **'Пауза без рассинхронизации'**
  String get clipInkFeature4;

  /// No description provided for @clipInkFeature5.
  ///
  /// In ru, this message translates to:
  /// **'15, 24, 30 или 60 кадров/с'**
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

  /// No description provided for @brandTagline.
  ///
  /// In ru, this message translates to:
  /// **'Локальные приложения для Windows'**
  String get brandTagline;

  /// No description provided for @navProducts.
  ///
  /// In ru, this message translates to:
  /// **'Продукты'**
  String get navProducts;

  /// No description provided for @navBenefits.
  ///
  /// In ru, this message translates to:
  /// **'Преимущества'**
  String get navBenefits;

  /// No description provided for @navAbout.
  ///
  /// In ru, this message translates to:
  /// **'О нас'**
  String get navAbout;

  /// No description provided for @navBlog.
  ///
  /// In ru, this message translates to:
  /// **'Блог'**
  String get navBlog;

  /// No description provided for @navContacts.
  ///
  /// In ru, this message translates to:
  /// **'Контакты'**
  String get navContacts;

  /// No description provided for @contactUs.
  ///
  /// In ru, this message translates to:
  /// **'Связаться'**
  String get contactUs;

  /// No description provided for @menuTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Меню'**
  String get menuTooltip;

  /// No description provided for @backToTop.
  ///
  /// In ru, this message translates to:
  /// **'Наверх'**
  String get backToTop;

  /// No description provided for @heroActionProducts.
  ///
  /// In ru, this message translates to:
  /// **'Смотреть продукты'**
  String get heroActionProducts;

  /// No description provided for @heroActionAbout.
  ///
  /// In ru, this message translates to:
  /// **'О нас'**
  String get heroActionAbout;

  /// No description provided for @mascotLabel.
  ///
  /// In ru, this message translates to:
  /// **'Спонж — маскот Pudra Soft'**
  String get mascotLabel;

  /// No description provided for @productsEyebrow.
  ///
  /// In ru, this message translates to:
  /// **'НАШИ ПРОДУКТЫ'**
  String get productsEyebrow;

  /// No description provided for @watchVideo.
  ///
  /// In ru, this message translates to:
  /// **'Смотреть видео'**
  String get watchVideo;

  /// No description provided for @close.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get close;

  /// No description provided for @previousScreenshot.
  ///
  /// In ru, this message translates to:
  /// **'Предыдущий скриншот'**
  String get previousScreenshot;

  /// No description provided for @nextScreenshot.
  ///
  /// In ru, this message translates to:
  /// **'Следующий скриншот'**
  String get nextScreenshot;

  /// No description provided for @screenshotsSoon.
  ///
  /// In ru, this message translates to:
  /// **'Скриншоты скоро появятся'**
  String get screenshotsSoon;

  /// No description provided for @whyUsEyebrow.
  ///
  /// In ru, this message translates to:
  /// **'ПОЧЕМУ ВЫБИРАЮТ НАС'**
  String get whyUsEyebrow;

  /// No description provided for @aboutEyebrow.
  ///
  /// In ru, this message translates to:
  /// **'О НАС'**
  String get aboutEyebrow;

  /// No description provided for @aboutText.
  ///
  /// In ru, this message translates to:
  /// **'Мы молодой стартап и создаём десктопные приложения, которые можно скачать и использовать бесплатно, без рекламы и подписок. Всё работает локально, а ваша обратная связь помогает нам делать продукты лучше.'**
  String get aboutText;

  /// No description provided for @aboutStep1Title.
  ///
  /// In ru, this message translates to:
  /// **'Планируйте проекты'**
  String get aboutStep1Title;

  /// No description provided for @aboutStep1Detail.
  ///
  /// In ru, this message translates to:
  /// **'Раскладывайте задачи и связывайте заметки на досках в DoSka.'**
  String get aboutStep1Detail;

  /// No description provided for @aboutStep2Title.
  ///
  /// In ru, this message translates to:
  /// **'Составляйте расписания'**
  String get aboutStep2Title;

  /// No description provided for @aboutStep2Detail.
  ///
  /// In ru, this message translates to:
  /// **'Ведите смены, отпуска и встречи в календаре Time Filler.'**
  String get aboutStep2Detail;

  /// No description provided for @aboutStep3Title.
  ///
  /// In ru, this message translates to:
  /// **'Показывайте результат'**
  String get aboutStep3Title;

  /// No description provided for @aboutStep3Detail.
  ///
  /// In ru, this message translates to:
  /// **'Записывайте экран со звуком и подписями в Clip Ink.'**
  String get aboutStep3Detail;

  /// No description provided for @ctaTitle.
  ///
  /// In ru, this message translates to:
  /// **'Попробуйте наши приложения уже сегодня'**
  String get ctaTitle;

  /// No description provided for @ctaSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатно, без подписки и регистрации. Кнопки ведут на последние версии.'**
  String get ctaSubtitle;

  /// No description provided for @partnersEyebrow.
  ///
  /// In ru, this message translates to:
  /// **'ПАРТНЕРЫ'**
  String get partnersEyebrow;

  /// No description provided for @blogEyebrow.
  ///
  /// In ru, this message translates to:
  /// **'ПОЛЕЗНОЕ'**
  String get blogEyebrow;

  /// No description provided for @readMore.
  ///
  /// In ru, this message translates to:
  /// **'Читать'**
  String get readMore;

  /// No description provided for @blog1Tag.
  ///
  /// In ru, this message translates to:
  /// **'МЕТОДОЛОГИИ'**
  String get blog1Tag;

  /// No description provided for @blog1Title.
  ///
  /// In ru, this message translates to:
  /// **'Что такое MVP и зачем он нужен'**
  String get blog1Title;

  /// No description provided for @blog1Summary.
  ///
  /// In ru, this message translates to:
  /// **'Как проверить идею продукта без лишних затрат.'**
  String get blog1Summary;

  /// No description provided for @blog1Content.
  ///
  /// In ru, this message translates to:
  /// **'MVP — минимально жизнеспособный продукт. Его цель — проверить ключевую гипотезу с минимальным набором возможностей. Начните с основной задачи пользователя, выпустите первую версию и соберите обратную связь, прежде чем расширять функциональность.'**
  String get blog1Content;

  /// No description provided for @blog2Tag.
  ///
  /// In ru, this message translates to:
  /// **'ПРОДУКТИВНОСТЬ'**
  String get blog2Tag;

  /// No description provided for @blog2Title.
  ///
  /// In ru, this message translates to:
  /// **'Как управлять рабочим временем'**
  String get blog2Title;

  /// No description provided for @blog2Summary.
  ///
  /// In ru, this message translates to:
  /// **'Практические принципы фокусировки и учёта времени.'**
  String get blog2Summary;

  /// No description provided for @blog2Content.
  ///
  /// In ru, this message translates to:
  /// **'Выделяйте приоритетные задачи, фиксируйте фактически затраченное время и регулярно сравнивайте план с результатом. Учёт времени нужен не для тотального контроля, а для понимания нагрузки и поиска возможностей улучшения.'**
  String get blog2Content;

  /// No description provided for @blog3Tag.
  ///
  /// In ru, this message translates to:
  /// **'ПРОЕКТЫ'**
  String get blog3Tag;

  /// No description provided for @blog3Title.
  ///
  /// In ru, this message translates to:
  /// **'Как организовать работу команды'**
  String get blog3Title;

  /// No description provided for @blog3Summary.
  ///
  /// In ru, this message translates to:
  /// **'Простая система задач, статусов и ответственности.'**
  String get blog3Summary;

  /// No description provided for @blog3Content.
  ///
  /// In ru, this message translates to:
  /// **'Определите цель проекта, разбейте работу на понятные задачи и назначьте ответственных. Регулярно обновляйте статусы и обсуждайте препятствия. Общая доска помогает команде видеть прогресс и не терять договорённости.'**
  String get blog3Content;

  /// No description provided for @blog4Tag.
  ///
  /// In ru, this message translates to:
  /// **'АНАЛИТИКА'**
  String get blog4Tag;

  /// No description provided for @blog4Title.
  ///
  /// In ru, this message translates to:
  /// **'Зачем анализировать затраты времени'**
  String get blog4Title;

  /// No description provided for @blog4Summary.
  ///
  /// In ru, this message translates to:
  /// **'Как находить узкие места в ежедневной работе.'**
  String get blog4Summary;

  /// No description provided for @blog4Content.
  ///
  /// In ru, this message translates to:
  /// **'Сопоставляйте время с типами задач и этапами проектов. Анализируйте тенденции за недели, а не только отдельные дни. Это помогает точнее оценивать сроки, распределять нагрузку и улучшать процессы.'**
  String get blog4Content;

  /// No description provided for @screenshotLabel.
  ///
  /// In ru, this message translates to:
  /// **'Скриншот {app}, номер {number}'**
  String screenshotLabel(String app, int number);

  /// No description provided for @downloadApp.
  ///
  /// In ru, this message translates to:
  /// **'Скачать {app}'**
  String downloadApp(String app);
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
