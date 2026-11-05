// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get heroSubtitle =>
      'Free Windows apps that work completely offline. Your data stays on your computer.';

  @override
  String get heroBadge => 'Free • No subscription • Fully offline';

  @override
  String get whyUsSubtitle =>
      'Pudra Soft apps are built for productive work with complete privacy for your data.';

  @override
  String get descriptionTitle => 'Description';

  @override
  String get versionsTitle => 'Versions';

  @override
  String get faqTitle => 'Frequently asked questions';

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
  String get doskaFeature1 => 'Hierarchical task lists (WBS)';

  @override
  String get doskaFeature2 => 'User story collection';

  @override
  String get doskaFeature3 => 'Links between notes';

  @override
  String get doskaFeature4 => 'Checklists';

  @override
  String get doskaFeature5 => 'Time tracking';

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
  String get timeFillerFeature1 => 'Shift schedules (2-on-2-off, 5/2)';

  @override
  String get timeFillerFeature2 => 'Employee vacation management';

  @override
  String get timeFillerFeature3 => 'Client bookings and meetings';

  @override
  String get timeFillerFeature4 => 'Sprint support';

  @override
  String get timeFillerFeature5 => 'Filtering by category';

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
  String get clipInkFeature1 => 'Frame, full screen, or window';

  @override
  String get clipInkFeature2 => 'Microphone and system audio';

  @override
  String get clipInkFeature3 => 'Drawing and captions';

  @override
  String get clipInkFeature4 => 'Pause without losing sync';

  @override
  String get clipInkFeature5 => '15, 24, 30, or 60 fps';

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

  @override
  String get brandTagline => 'Local apps for Windows';

  @override
  String get navProducts => 'Products';

  @override
  String get navBenefits => 'Benefits';

  @override
  String get navAbout => 'About';

  @override
  String get navBlog => 'Blog';

  @override
  String get navContacts => 'Contacts';

  @override
  String get contactUs => 'Contact us';

  @override
  String get menuTooltip => 'Menu';

  @override
  String get backToTop => 'Back to top';

  @override
  String get heroActionProducts => 'View products';

  @override
  String get heroActionAbout => 'About us';

  @override
  String get mascotLabel => 'Sponge, the Pudra Soft mascot';

  @override
  String get productsEyebrow => 'OUR PRODUCTS';

  @override
  String get watchVideo => 'Watch video';

  @override
  String get close => 'Close';

  @override
  String get previousScreenshot => 'Previous screenshot';

  @override
  String get nextScreenshot => 'Next screenshot';

  @override
  String get screenshotsSoon => 'Screenshots coming soon';

  @override
  String get whyUsEyebrow => 'WHY CHOOSE US';

  @override
  String get aboutEyebrow => 'ABOUT US';

  @override
  String get aboutText =>
      'We are a young startup building desktop apps that you can download and use for free, with no ads or subscriptions. Everything runs locally, and your feedback helps us make the products better.';

  @override
  String get aboutStep1Title => 'Plan projects';

  @override
  String get aboutStep1Detail =>
      'Break down tasks and link notes on boards in DoSka.';

  @override
  String get aboutStep2Title => 'Build schedules';

  @override
  String get aboutStep2Detail =>
      'Manage shifts, vacations, and meetings in the Time Filler calendar.';

  @override
  String get aboutStep3Title => 'Show your results';

  @override
  String get aboutStep3Detail =>
      'Record your screen with sound and captions in Clip Ink.';

  @override
  String get ctaTitle => 'Try our apps today';

  @override
  String get ctaSubtitle =>
      'Free, with no subscription or sign-up. The buttons lead to the latest versions.';

  @override
  String get partnersEyebrow => 'PARTNERS';

  @override
  String get blogEyebrow => 'USEFUL READS';

  @override
  String get readMore => 'Read';

  @override
  String get blog1Tag => 'METHODS';

  @override
  String get blog1Title => 'What an MVP is and why you need one';

  @override
  String get blog1Summary =>
      'How to test a product idea without unnecessary costs.';

  @override
  String get blog1Content =>
      'An MVP is a minimum viable product. Its goal is to test the key hypothesis with the smallest possible set of features. Start with the main user task, release a first version, and gather feedback before adding functionality.';

  @override
  String get blog2Tag => 'PRODUCTIVITY';

  @override
  String get blog2Title => 'How to manage your working time';

  @override
  String get blog2Summary =>
      'Practical principles for focus and time tracking.';

  @override
  String get blog2Content =>
      'Identify priority tasks, record the time you actually spend, and regularly compare the plan with the result. Time tracking is not about total control; it helps you understand your workload and find ways to improve.';

  @override
  String get blog3Tag => 'PROJECTS';

  @override
  String get blog3Title => 'How to organize team work';

  @override
  String get blog3Summary =>
      'A simple system of tasks, statuses, and responsibility.';

  @override
  String get blog3Content =>
      'Define the project goal, break the work into clear tasks, and assign owners. Update statuses regularly and discuss obstacles. A shared board helps the team see progress and keep track of agreements.';

  @override
  String get blog4Tag => 'ANALYTICS';

  @override
  String get blog4Title => 'Why analyze the time you spend';

  @override
  String get blog4Summary => 'How to find bottlenecks in your daily work.';

  @override
  String get blog4Content =>
      'Match time against task types and project stages. Look at trends over weeks, not just individual days. This helps you estimate deadlines more accurately, distribute the workload, and improve processes.';

  @override
  String screenshotLabel(String app, int number) {
    return '$app screenshot, number $number';
  }

  @override
  String downloadApp(String app) {
    return 'Download $app';
  }
}
