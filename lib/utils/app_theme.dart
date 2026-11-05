import 'package:flutter/material.dart';

/// Фирменные цвета приложений.
enum AppAccent { doska, timeFiller, clipInk }

/// Цвета сайта, которых нет в [ColorScheme].
@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Map<AppAccent, Color> accents;

  /// Подложка под логотипами партнёров.
  final Color logoBackground;

  /// Затемнение поверх обложки видео.
  final Color videoOverlay;

  /// Прозрачность подложки главного экрана по краям и в центре.
  final double heroEdgeOpacity;
  final double heroCenterOpacity;

  const AppColors({
    required this.accents,
    required this.logoBackground,
    required this.videoOverlay,
    required this.heroEdgeOpacity,
    required this.heroCenterOpacity,
  });

  static AppColors of(BuildContext context) {
    return Theme.of(context).extension<AppColors>()!;
  }

  Color accent(AppAccent app) => accents[app]!;

  @override
  AppColors copyWith({
    Map<AppAccent, Color>? accents,
    Color? logoBackground,
    Color? videoOverlay,
    double? heroEdgeOpacity,
    double? heroCenterOpacity,
  }) {
    return AppColors(
      accents: accents ?? this.accents,
      logoBackground: logoBackground ?? this.logoBackground,
      videoOverlay: videoOverlay ?? this.videoOverlay,
      heroEdgeOpacity: heroEdgeOpacity ?? this.heroEdgeOpacity,
      heroCenterOpacity: heroCenterOpacity ?? this.heroCenterOpacity,
    );
  }

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      accents: {
        for (final app in AppAccent.values)
          app: Color.lerp(accent(app), other.accent(app), t)!,
      },
      logoBackground: Color.lerp(logoBackground, other.logoBackground, t)!,
      videoOverlay: Color.lerp(videoOverlay, other.videoOverlay, t)!,
      heroEdgeOpacity: lerpDouble(heroEdgeOpacity, other.heroEdgeOpacity, t),
      heroCenterOpacity:
          lerpDouble(heroCenterOpacity, other.heroCenterOpacity, t),
    );
  }

  static double lerpDouble(double a, double b, double t) => a + (b - a) * t;
}

/// Папки с картинками текущей темы.
@immutable
class AppImages extends ThemeExtension<AppImages> {
  final String imagesDir;
  final String screenshotsDir;

  const AppImages({required this.imagesDir, required this.screenshotsDir});

  static AppImages of(BuildContext context) {
    return Theme.of(context).extension<AppImages>()!;
  }

  /// Путь к картинке из `assets/images/<тема>/`.
  String image(String fileName) => '$imagesDir/$fileName';

  /// Путь к скриншоту из `assets/screenshots/<тема>/`.
  String screenshot(String fileName) => '$screenshotsDir/$fileName';

  @override
  AppImages copyWith({String? imagesDir, String? screenshotsDir}) {
    return AppImages(
      imagesDir: imagesDir ?? this.imagesDir,
      screenshotsDir: screenshotsDir ?? this.screenshotsDir,
    );
  }

  @override
  AppImages lerp(covariant AppImages? other, double t) {
    if (other == null) return this;
    return t < 0.5 ? this : other;
  }
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF5B45B8),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFB03A66),
      onSecondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFF1B7490),
      onTertiary: Color(0xFFFFFFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFF7F5FF),
      onSurface: Color(0xFF1F1A33),
      onSurfaceVariant: Color(0xFF4A4460),
      surfaceContainerHighest: Color(0xFFE4DEF5),
      surfaceContainer: Color(0xFFF0ECFB),
      surfaceContainerLow: Color(0xFFF5F2FC),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      outline: Color(0xFF5F5478),
      outlineVariant: Color(0xFFC6BDDD),
      shadow: Color(0x22000000),
      inverseSurface: Color(0xFF2D2D4A),
      onInverseSurface: Color(0xFFF5F3FF),
      surfaceDim: Color(0xFFDFD8F0),
      surfaceBright: Color(0xFFFFFFFF),
      scrim: Color(0x80000000),
    ),
    extensions: const [
      AppColors(
        accents: {
          AppAccent.doska: Color(0xFF8A4590),
          AppAccent.timeFiller: Color(0xFF00705A),
          AppAccent.clipInk: Color(0xFF2C5BC0),
        },
        logoBackground: Color(0xFFF5F3FF),
        videoOverlay: Color(0x991A1A2E),
        // Баннер тёмный, поэтому текст держится на плотной подложке.
        heroEdgeOpacity: 0.88,
        heroCenterOpacity: 0.92,
      ),
      AppImages(
        imagesDir: 'assets/images/light',
        screenshotsDir: 'assets/screenshots/light',
      ),
    ],
  );

  // Темная тема с приятной светлой цветовой палитрой
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,

      // Основной цвет - мягкий лавандовый
      primary: Color(0xFFC4B5FF),
      onPrimary: Color(0xFF1A1A2E),

      // Вторичный цвет - нежный розово-персиковый
      secondary: Color(0xFFFFB5C2),
      onSecondary: Color(0xFF1A1A2E),

      // Ошибка - мягкий коралловый
      error: Color(0xFFFF8A8A),
      onError: Color(0xFF1A1A2E),

      // Основная поверхность - светлый серо-фиолетовый
      surface: Color(0xFF2D2D4A),
      onSurface: Color(0xFFF5F3FF),

      // Градации поверхностей - все светлее и воздушнее
      surfaceContainerHighest: Color(0xFF3D3D60),
      // Самый светлый фон
      surfaceContainer: Color(0xFF343457),
      // Средний фон
      surfaceContainerLow: Color(0xFF2A2A4A),
      // Темнее
      surfaceContainerLowest: Color(0xFF22223D),
      // Самый темный фон

      // Контуры - мягкие и ненавязчивые
      outline: Color(0xFFAA98C4),
      outlineVariant: Color(0xFF72699B),

      // Тени и инверсные поверхности
      shadow: Color(0x33000000),
      inverseSurface: Color(0xFFF5F3FF),
      onInverseSurface: Color(0xFF1A1A2E),

      // Третичный цвет - мятно-голубой для акцентов
      tertiary: Color(0xFF8DD4E8),
      onTertiary: Color(0xFF1A1A2E),

      // Поверхности для диммера
      surfaceDim: Color(0xFF3D3659),
      surfaceBright: Color(0xFF615883),

      // Затемнение
      scrim: Color(0x80000000),
    ),
    extensions: const [
      AppColors(
        accents: {
          AppAccent.doska: Color(0xFFBF7DC4),
          AppAccent.timeFiller: Color(0xFF00B894),
          AppAccent.clipInk: Color(0xFF6C9EFF),
        },
        logoBackground: Color(0xFFF5F3FF),
        videoOverlay: Color(0x991A1A2E),
        heroEdgeOpacity: 0.4,
        heroCenterOpacity: 0.6,
      ),
      AppImages(
        imagesDir: 'assets/images/dark',
        screenshotsDir: 'assets/screenshots/dark',
      ),
    ],
  );
}
