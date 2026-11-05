// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get supportTooltip => 'Поддержка ВКонтакте';

  @override
  String get otherLanguageLabel => 'EN';

  @override
  String get otherLanguageTooltip => 'Switch to English';

  @override
  String get lightThemeTooltip => 'Светлая тема';

  @override
  String get darkThemeTooltip => 'Тёмная тема';

  @override
  String get heroTitle => 'Локальное ПО для\nпродуктивной работы';

  @override
  String get heroSubtitleMobile =>
      'Бесплатные приложения для Windows,\nработающие полностью автономно';

  @override
  String get heroSubtitle =>
      'Бесплатные приложения для Windows, которые работают полностью автономно.\nВаши данные — только на вашем компьютере.';

  @override
  String get heroBadgeMobile => 'Бесплатно • Без подписки';

  @override
  String get heroBadge => 'Бесплатно • Без подписки • Полная автономность';

  @override
  String get productsTitle => 'Программные продукты';

  @override
  String get partnersTitle => 'Партнеры';

  @override
  String get whyUsTitle => 'Почему выбирают нас';

  @override
  String get whyUsSubtitleMobile =>
      'Приложения от Pudra Soft для продуктивной работы\nс полной приватностью';

  @override
  String get whyUsSubtitle =>
      'Приложения от Pudra Soft созданы для продуктивной работы\nс полной приватностью ваших данных';

  @override
  String get descriptionTitle => 'Описание';

  @override
  String get galleryTitle => 'Галерея';

  @override
  String get featuresTitle => 'Ключевые возможности';

  @override
  String get benefitsTitle => 'Преимущества';

  @override
  String get versionsTitle => 'Версии';

  @override
  String get faqTitle => 'Часто задаваемые вопросы';

  @override
  String get download => 'Скачать';

  @override
  String get downloadFree => 'Скачать бесплатно';

  @override
  String versionForWindows(String version) {
    return 'Версия $version для Windows';
  }

  @override
  String version(String version) {
    return 'Версия $version';
  }

  @override
  String get loadingVersions => 'Загружаем список версий…';

  @override
  String versionsError(String version) {
    return 'Не удалось получить список версий. Вы можете скачать версию $version кнопкой на этой странице или открыть все версии на GitHub.';
  }

  @override
  String get noVersions => 'Опубликованных версий пока нет.';

  @override
  String get latestBadge => 'Последняя';

  @override
  String get prereleaseBadge => 'Предварительная';

  @override
  String get whatsNew => 'Что нового';

  @override
  String get openRelease => 'Открыть';

  @override
  String fileSize(double size) {
    final intl.NumberFormat sizeNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
            locale: localeName, decimalDigits: 1);
    final String sizeString = sizeNumberFormat.format(size);

    return '$sizeString МБ';
  }

  @override
  String downloadWithSize(String size) {
    return 'Скачать, $size';
  }

  @override
  String releaseDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String get collapse => 'Свернуть';

  @override
  String showAllVersions(int count) {
    return 'Показать все версии ($count)';
  }

  @override
  String get allReleasesOnGithub => 'Все релизы на GitHub';

  @override
  String get vkGroup => 'Группа ВКонтакте';

  @override
  String get maxChannel => 'Канал в MAX';

  @override
  String get copyright => '© 2026 Pudra Soft. Все права защищены.';

  @override
  String get footerNote =>
      'Приложения работают полностью локально. Ваши данные — только на вашем компьютере.';

  @override
  String get whyOfflineTitle => 'Полная автономность';

  @override
  String get whyOfflineDescription =>
      'Работает без интернета. Все данные хранятся только на вашем компьютере.';

  @override
  String get whyInstallTitle => 'Мгновенная установка';

  @override
  String get whyInstallDescription =>
      'Установка занимает 1 минуту из одного файла без сложных настроек.';

  @override
  String get whyFreeTitle => 'Абсолютно бесплатно';

  @override
  String get whyFreeDescription =>
      'Никаких подписок и скрытых платежей. Скачал и пользуйся.';

  @override
  String get whyDataTitle => 'Полный контроль данных';

  @override
  String get whyDataDescription =>
      'Никаких облачных сервисов. Ваши данные под вашим контролем.';

  @override
  String get whyWindowsTitle => 'Для Windows 10/11';

  @override
  String get whyWindowsDescription =>
      'Полная совместимость с современными версиями Windows.';

  @override
  String get whySupportTitle => 'Бесплатная поддержка';

  @override
  String get whySupportDescription =>
      'Техподдержка через официальную группу ВКонтакте.';

  @override
  String get partnerScanSoftName => 'Скан Софт';

  @override
  String get partnerScanSoftDescription =>
      'Дистрибьютор нашего программного обеспечения';

  @override
  String get doskaSubtitle => 'Конструктор проектов';

  @override
  String get doskaDescription =>
      'Персональный конструктор проектов для Windows';

  @override
  String get doskaDetails =>
      'DoSka — это персональный конструктор проектов для Windows. Простое и мощное приложение для визуального планирования, которое поможет структурировать любую задачу: от бизнес-процесса до учебного проекта.\n\nПриложение работает полностью локально, без подключения к интернету и облачным сервисам, гарантируя, что все данные останутся только на вашем компьютере.\n\nРешение позволяет собирать пользовательские истории, визуализировать процессы и техкарты, а также декомпозировать задачи любого уровня сложности.';

  @override
  String get doskaFeature1 => '📋 Иерархические списки задач (WBS)';

  @override
  String get doskaFeature2 => '📝 Сбор пользовательских историй';

  @override
  String get doskaFeature3 => '🔗 Связи между заметками';

  @override
  String get doskaFeature4 => '✅ Чек-листы';

  @override
  String get doskaFeature5 => '🎨 Управление временем выполнения';

  @override
  String get doskaBenefit1 => 'Полная автономность (без интернета и облаков)';

  @override
  String get doskaBenefit2 => 'Мгновенная установка из одного файла';

  @override
  String get doskaBenefit3 => 'Визуальный конструктор для любых проектов';

  @override
  String get doskaBenefit4 => 'Все данные под вашим полным контролем';

  @override
  String get doskaBenefit5 => 'Бесплатно для частного использования';

  @override
  String get doskaFaq1Question => 'Как работает DoSka?';

  @override
  String get doskaFaq1Answer =>
      'Это локальный конструктор проектов для Windows. Прототипом послужила магнитная доска с цветными стикерами (заметками). Здесь можно создать несколько проектов с досками. Заметки можно связывать между собой и запускать таймеры для контроля времени.';

  @override
  String get doskaFaq2Question => 'Сколько проектов можно создать?';

  @override
  String get doskaFaq2Answer =>
      'Можно создать до 20 проектов. В каждом проекте - до 20 досок, на каждой доске - до 100 заметок.';

  @override
  String get doskaFaq3Question => 'Можно ли экспортировать проект?';

  @override
  String get doskaFaq3Answer =>
      'На данный момент функция экспорта проектов находится в разработке. Это гарантирует, что никто не изменит ваши данные без вашего ведома.';

  @override
  String get doskaFaq4Question =>
      'Почему Windows показывает предупреждение при установке?';

  @override
  String get doskaFaq4Answer =>
      'Официальное одобрение от Microsoft ожидается, но из-за санкционных ограничений процесс затягивается. Это не влияет на безопасность — приложение не собирает данные и полностью безопасно.';

  @override
  String get timeFillerSubtitle => 'Планировщик для команд';

  @override
  String get timeFillerDescription =>
      'Локальный планировщик для небольших команд';

  @override
  String get timeFillerDetails =>
      'TimeFiller — это локальный планировщик для Windows, созданный для небольших команд. Приложение работает полностью автономно, без подключения к интернету и облачным сервисам, гарантируя, что все данные останутся только на вашем компьютере.\n\nРешение позволяет управлять отпусками сотрудников, вести запись клиентов, планировать встречи и регулярные события, а также организовывать работу по спринтам.';

  @override
  String get timeFillerFeature1 => '📅 Графики смен (2 через 2, 5/2)';

  @override
  String get timeFillerFeature2 => '🏖️ Управление отпусками сотрудников';

  @override
  String get timeFillerFeature3 => '👥 Запись клиентов и встреч';

  @override
  String get timeFillerFeature4 => '🔄 Поддержка спринтов';

  @override
  String get timeFillerFeature5 => '🎯 Фильтрация по категориям';

  @override
  String get timeFillerBenefit1 =>
      'Полная автономность (без интернета и облаков)';

  @override
  String get timeFillerBenefit2 => 'Мгновенная установка из одного файла';

  @override
  String get timeFillerBenefit3 => 'Визуальный календарь для всех сценариев';

  @override
  String get timeFillerBenefit4 => 'Настройка прозрачности интерфейса';

  @override
  String get timeFillerBenefit5 => 'Бесплатно для небольших команд';

  @override
  String get timeFillerFaq1Question => 'Как работает TimeFiller?';

  @override
  String get timeFillerFaq1Answer =>
      'Это локальный планировщик для Windows. Вы создаёте диапазоны с категориями, и они отображаются в календаре.';

  @override
  String get timeFillerFaq2Question => 'Можно ли создавать графики 2 через 2?';

  @override
  String get timeFillerFaq2Answer =>
      'Да, в приложении есть быстрая настройка смен с помощью повторов диапазонов. Вы можете создать любой график работы.';

  @override
  String get timeFillerFaq3Question => 'Как вести учёт отпусков?';

  @override
  String get timeFillerFaq3Answer =>
      'Создайте диапазон с категорией \"Отпуск\" для нужного сотрудника. Все отпуска будут отображаться в календаре и их можно фильтровать.';

  @override
  String get timeFillerFaq4Question =>
      'Поддерживается ли интеграция с другими программами?';

  @override
  String get timeFillerFaq4Answer =>
      'Нет, TimeFiller — полностью самостоятельное приложение. Оно не требует интеграций и работает локально.';

  @override
  String get clipInkSubtitle => 'Запись экрана';

  @override
  String get clipInkDescription =>
      'Лёгкая программа для записи экрана в Windows';

  @override
  String get clipInkDetails =>
      'Clip Ink — лёгкая программа для записи экрана в Windows. Вы двигаете и растягиваете рамку над нужным местом, нажимаете «Начать запись» и получаете обычный MP4, который открывается в любом плеере и загружается на любые площадки. Рамка в видео не попадает: пишется только то, что внутри неё.\n\nЗаписать можно произвольную область, весь экран или окно приложения, со звуком микрофона, системы или сразу обоих источников. Во время записи можно рисовать и добавлять подписи.';

  @override
  String get clipInkFeature1 => '🖼️ Рамка, весь экран или окно';

  @override
  String get clipInkFeature2 => '🎙️ Микрофон и системный звук';

  @override
  String get clipInkFeature3 => '✏️ Рисование и подписи';

  @override
  String get clipInkFeature4 => '⏸️ Пауза без рассинхронизации';

  @override
  String get clipInkFeature5 => '🎞️ 15, 24, 30 или 60 кадров/с';

  @override
  String get clipInkBenefit1 =>
      'Обычный MP4 (H.264 + AAC) для любых плееров и площадок';

  @override
  String get clipInkBenefit2 =>
      'Записанное сохранится при аварийном закрытии программы';

  @override
  String get clipInkBenefit3 => 'Контроль свободного места на диске';

  @override
  String get clipInkBenefit4 => 'Интерфейс на русском и английском';

  @override
  String get clipInkBenefit5 => 'Работает на Windows 10 и 11 (64-бит)';

  @override
  String get clipInkFaq1Question => 'Какая максимальная длина записи?';

  @override
  String get clipInkFaq1Answer =>
      'Один ролик — не дольше 20 минут. При достижении лимита запись сохраняется автоматически, и можно сразу начать следующую.';

  @override
  String get clipInkFaq2Question =>
      'Можно ли включать и выключать звук во время записи?';

  @override
  String get clipInkFaq2Answer =>
      'Да, микрофон и звук с монитора можно отключать и включать прямо во время записи, не останавливая её.';

  @override
  String get clipInkFaq3Question => 'Почему часть видео записывается чёрной?';

  @override
  String get clipInkFaq3Answer =>
      'Содержимое с аппаратным ускорением (часть игр, видео с защитой DRM) может записываться чёрным.';

  @override
  String get clipInkFaq4Question => 'Есть ли эхоподавление?';

  @override
  String get clipInkFaq4Answer =>
      'Нет. Если пишете и микрофон, и звук с монитора, используйте наушники.';
}
