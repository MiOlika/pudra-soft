// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get supportTooltip => 'Support on VK';

  @override
  String get otherLanguageLabel => 'RU';

  @override
  String get otherLanguageTooltip => 'Переключить на русский';

  @override
  String get lightThemeTooltip => 'Light theme';

  @override
  String get darkThemeTooltip => 'Dark theme';

  @override
  String get heroTitle => 'Local software for\nproductive work';

  @override
  String get heroSubtitleMobile =>
      'Free Windows apps\nthat work completely offline';

  @override
  String get heroSubtitle =>
      'Free Windows apps that work completely offline.\nYour data stays on your computer.';

  @override
  String get heroBadgeMobile => 'Free • No subscription';

  @override
  String get heroBadge => 'Free • No subscription • Fully offline';

  @override
  String get productsTitle => 'Software products';

  @override
  String get partnersTitle => 'Partners';

  @override
  String get whyUsTitle => 'Why choose us';

  @override
  String get whyUsSubtitleMobile =>
      'Pudra Soft apps for productive work\nwith complete privacy';

  @override
  String get whyUsSubtitle =>
      'Pudra Soft apps are built for productive work\nwith complete privacy for your data';

  @override
  String get descriptionTitle => 'Description';

  @override
  String get galleryTitle => 'Gallery';

  @override
  String get featuresTitle => 'Key features';

  @override
  String get benefitsTitle => 'Benefits';

  @override
  String get versionsTitle => 'Versions';

  @override
  String get faqTitle => 'Frequently asked questions';

  @override
  String get download => 'Download';

  @override
  String get downloadFree => 'Download for free';

  @override
  String versionForWindows(String version) {
    return 'Version $version for Windows';
  }

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get loadingVersions => 'Loading versions…';

  @override
  String versionsError(String version) {
    return 'Could not load the list of versions. You can download version $version with the button on this page or open all versions on GitHub.';
  }

  @override
  String get noVersions => 'No versions have been published yet.';

  @override
  String get latestBadge => 'Latest';

  @override
  String get prereleaseBadge => 'Pre-release';

  @override
  String get whatsNew => 'What\'s new';

  @override
  String get openRelease => 'Open';

  @override
  String fileSize(double size) {
    final intl.NumberFormat sizeNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
            locale: localeName, decimalDigits: 1);
    final String sizeString = sizeNumberFormat.format(size);

    return '$sizeString MB';
  }

  @override
  String downloadWithSize(String size) {
    return 'Download, $size';
  }

  @override
  String releaseDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String get collapse => 'Show less';

  @override
  String showAllVersions(int count) {
    return 'Show all versions ($count)';
  }

  @override
  String get allReleasesOnGithub => 'All releases on GitHub';

  @override
  String get vkGroup => 'VK group';

  @override
  String get maxChannel => 'MAX channel';

  @override
  String get copyright => '© 2026 Pudra Soft. All rights reserved.';

  @override
  String get footerNote =>
      'The apps work entirely locally. Your data stays on your computer.';

  @override
  String get whyOfflineTitle => 'Fully offline';

  @override
  String get whyOfflineDescription =>
      'Works without the internet. All data is stored only on your computer.';

  @override
  String get whyInstallTitle => 'Instant installation';

  @override
  String get whyInstallDescription =>
      'Installs from a single file in a minute, with no complicated setup.';

  @override
  String get whyFreeTitle => 'Completely free';

  @override
  String get whyFreeDescription =>
      'No subscriptions or hidden fees. Just download and use.';

  @override
  String get whyDataTitle => 'Full control of your data';

  @override
  String get whyDataDescription =>
      'No cloud services. Your data stays under your control.';

  @override
  String get whyWindowsTitle => 'For Windows 10/11';

  @override
  String get whyWindowsDescription =>
      'Fully compatible with current versions of Windows.';

  @override
  String get whySupportTitle => 'Free support';

  @override
  String get whySupportDescription =>
      'Technical support through our official VK group.';

  @override
  String get partnerScanSoftName => 'Scan Soft';

  @override
  String get partnerScanSoftDescription => 'Distributor of our software';

  @override
  String get doskaSubtitle => 'Project builder';

  @override
  String get doskaDescription => 'A personal project builder for Windows';

  @override
  String get doskaDetails =>
      'DoSka is a personal project builder for Windows. It is a simple yet powerful visual planning app that helps you structure any task, from a business process to a study project.\n\nThe app runs entirely locally, with no internet connection or cloud services, so all your data stays on your computer.\n\nUse it to collect user stories, visualize processes and process charts, and break down tasks of any complexity.';

  @override
  String get doskaFeature1 => '📋 Hierarchical task lists (WBS)';

  @override
  String get doskaFeature2 => '📝 User story collection';

  @override
  String get doskaFeature3 => '🔗 Links between notes';

  @override
  String get doskaFeature4 => '✅ Checklists';

  @override
  String get doskaFeature5 => '🎨 Time tracking';

  @override
  String get doskaBenefit1 => 'Fully offline (no internet or cloud)';

  @override
  String get doskaBenefit2 => 'Instant installation from a single file';

  @override
  String get doskaBenefit3 => 'A visual builder for any project';

  @override
  String get doskaBenefit4 => 'All data under your full control';

  @override
  String get doskaBenefit5 => 'Free for personal use';

  @override
  String get doskaFaq1Question => 'How does DoSka work?';

  @override
  String get doskaFaq1Answer =>
      'It is a local project builder for Windows, modeled on a magnetic board with colored sticky notes. You can create several projects with boards, link notes to each other, and start timers to keep track of time.';

  @override
  String get doskaFaq2Question => 'How many projects can I create?';

  @override
  String get doskaFaq2Answer =>
      'You can create up to 20 projects, with up to 20 boards in each project and up to 100 notes on each board.';

  @override
  String get doskaFaq3Question => 'Can I export a project?';

  @override
  String get doskaFaq3Answer =>
      'Project export is currently in development. This ensures that nobody can change your data without your knowledge.';

  @override
  String get doskaFaq4Question =>
      'Why does Windows show a warning during installation?';

  @override
  String get doskaFaq4Answer =>
      'Official approval from Microsoft is pending, but the process is delayed by sanctions restrictions. This does not affect security: the app does not collect data and is completely safe.';

  @override
  String get timeFillerSubtitle => 'Team scheduler';

  @override
  String get timeFillerDescription => 'A local scheduler for small teams';

  @override
  String get timeFillerDetails =>
      'TimeFiller is a local scheduler for Windows, built for small teams. The app works completely offline, with no internet connection or cloud services, so all your data stays on your computer.\n\nUse it to manage employee vacations, book clients, plan meetings and recurring events, and organize work in sprints.';

  @override
  String get timeFillerFeature1 => '📅 Shift schedules (2-on-2-off, 5/2)';

  @override
  String get timeFillerFeature2 => '🏖️ Employee vacation management';

  @override
  String get timeFillerFeature3 => '👥 Client bookings and meetings';

  @override
  String get timeFillerFeature4 => '🔄 Sprint support';

  @override
  String get timeFillerFeature5 => '🎯 Filtering by category';

  @override
  String get timeFillerBenefit1 => 'Fully offline (no internet or cloud)';

  @override
  String get timeFillerBenefit2 => 'Instant installation from a single file';

  @override
  String get timeFillerBenefit3 => 'A visual calendar for every scenario';

  @override
  String get timeFillerBenefit4 => 'Adjustable interface transparency';

  @override
  String get timeFillerBenefit5 => 'Free for small teams';

  @override
  String get timeFillerFaq1Question => 'How does TimeFiller work?';

  @override
  String get timeFillerFaq1Answer =>
      'It is a local scheduler for Windows. You create date ranges with categories, and they appear in the calendar.';

  @override
  String get timeFillerFaq2Question => 'Can I create 2-on-2-off schedules?';

  @override
  String get timeFillerFaq2Answer =>
      'Yes, the app lets you set up shifts quickly by repeating date ranges. You can create any work schedule.';

  @override
  String get timeFillerFaq3Question => 'How do I keep track of vacations?';

  @override
  String get timeFillerFaq3Answer =>
      'Create a date range with a \"Vacation\" category for the employee. All vacations appear in the calendar and can be filtered.';

  @override
  String get timeFillerFaq4Question => 'Does it integrate with other software?';

  @override
  String get timeFillerFaq4Answer =>
      'No, TimeFiller is a fully standalone app. It needs no integrations and works locally.';

  @override
  String get clipInkSubtitle => 'Screen recorder';

  @override
  String get clipInkDescription => 'A lightweight screen recorder for Windows';

  @override
  String get clipInkDetails =>
      'Clip Ink is a lightweight screen recorder for Windows. Move and resize the frame over the area you need, click \"Start recording\", and get a regular MP4 that opens in any player and uploads to any platform. The frame itself stays out of the video: only what is inside it gets recorded.\n\nRecord a custom area, the whole screen, or an app window, with sound from the microphone, the system, or both. You can draw and add captions while recording.';

  @override
  String get clipInkFeature1 => '🖼️ Frame, full screen, or window';

  @override
  String get clipInkFeature2 => '🎙️ Microphone and system audio';

  @override
  String get clipInkFeature3 => '✏️ Drawing and captions';

  @override
  String get clipInkFeature4 => '⏸️ Pause without losing sync';

  @override
  String get clipInkFeature5 => '🎞️ 15, 24, 30, or 60 fps';

  @override
  String get clipInkBenefit1 =>
      'Regular MP4 (H.264 + AAC) for any player or platform';

  @override
  String get clipInkBenefit2 =>
      'Your recording is kept if the app closes unexpectedly';

  @override
  String get clipInkBenefit3 => 'Free disk space monitoring';

  @override
  String get clipInkBenefit4 => 'Interface in Russian and English';

  @override
  String get clipInkBenefit5 => 'Runs on Windows 10 and 11 (64-bit)';

  @override
  String get clipInkFaq1Question => 'What is the maximum recording length?';

  @override
  String get clipInkFaq1Answer =>
      'One video can be up to 20 minutes long. When the limit is reached, the recording is saved automatically and you can start the next one right away.';

  @override
  String get clipInkFaq2Question =>
      'Can I turn sound on and off while recording?';

  @override
  String get clipInkFaq2Answer =>
      'Yes, you can mute and unmute the microphone and system audio during recording without stopping it.';

  @override
  String get clipInkFaq3Question =>
      'Why does part of the video record as black?';

  @override
  String get clipInkFaq3Answer =>
      'Hardware-accelerated content (some games, DRM-protected video) may be recorded as black.';

  @override
  String get clipInkFaq4Question => 'Is there echo cancellation?';

  @override
  String get clipInkFaq4Answer =>
      'No. If you record both the microphone and system audio, use headphones.';
}
