import 'package:flutter/material.dart';

/// Приложения с собственным цветом.
enum AppAccent { doska, timeFiller, clipInk }

/// Цвета дизайна сайта, которых нет в [ColorScheme].
@immutable
class SiteColors extends ThemeExtension<SiteColors> {
  final List<Color> heroGradient;
  final List<Color> cardGradient;
  final List<Color> softCardGradient;
  final List<Color> frameGradient;
  final List<Color> mascotGradient;
  final List<Color> iconGradient;
  final List<Color> ctaGradient;
  final List<Color> footerGradient;

  /// Цвета приложений для текущей темы.
  final Map<AppAccent, Color> accents;

  /// Фоны обложек статей блога.
  final List<Color> blogAccents;
  final Color iconTile;
  final Color cardBorder;
  final Color glow;
  final Color windowBar;
  final Color windowBackground;

  /// Подложка под логотипами: они рассчитаны на светлый фон.
  final Color logoBackground;
  final Color footerText;

  const SiteColors({
    required this.heroGradient,
    required this.cardGradient,
    required this.softCardGradient,
    required this.frameGradient,
    required this.mascotGradient,
    required this.iconGradient,
    required this.ctaGradient,
    required this.footerGradient,
    required this.accents,
    required this.blogAccents,
    required this.iconTile,
    required this.cardBorder,
    required this.glow,
    required this.windowBar,
    required this.windowBackground,
    required this.logoBackground,
    required this.footerText,
  });

  static SiteColors of(BuildContext context) {
    return Theme.of(context).extension<SiteColors>()!;
  }

  Color accent(AppAccent app) => accents[app]!;

  @override
  SiteColors copyWith({Color? iconTile, Color? cardBorder}) {
    return SiteColors(
      heroGradient: heroGradient,
      cardGradient: cardGradient,
      softCardGradient: softCardGradient,
      frameGradient: frameGradient,
      mascotGradient: mascotGradient,
      iconGradient: iconGradient,
      ctaGradient: ctaGradient,
      footerGradient: footerGradient,
      accents: accents,
      blogAccents: blogAccents,
      iconTile: iconTile ?? this.iconTile,
      cardBorder: cardBorder ?? this.cardBorder,
      glow: glow,
      windowBar: windowBar,
      windowBackground: windowBackground,
      logoBackground: logoBackground,
      footerText: footerText,
    );
  }

  @override
  SiteColors lerp(covariant SiteColors? other, double t) {
    if (other == null) return this;

    List<Color> list(List<Color> a, List<Color> b) => [
          for (var i = 0; i < a.length; i++) Color.lerp(a[i], b[i], t)!,
        ];
    Color one(Color a, Color b) => Color.lerp(a, b, t)!;

    return SiteColors(
      heroGradient: list(heroGradient, other.heroGradient),
      cardGradient: list(cardGradient, other.cardGradient),
      softCardGradient: list(softCardGradient, other.softCardGradient),
      frameGradient: list(frameGradient, other.frameGradient),
      mascotGradient: list(mascotGradient, other.mascotGradient),
      iconGradient: list(iconGradient, other.iconGradient),
      ctaGradient: list(ctaGradient, other.ctaGradient),
      footerGradient: list(footerGradient, other.footerGradient),
      accents: {
        for (final app in AppAccent.values)
          app: one(accent(app), other.accent(app)),
      },
      blogAccents: list(blogAccents, other.blogAccents),
      iconTile: one(iconTile, other.iconTile),
      cardBorder: one(cardBorder, other.cardBorder),
      glow: one(glow, other.glow),
      windowBar: one(windowBar, other.windowBar),
      windowBackground: one(windowBackground, other.windowBackground),
      logoBackground: one(logoBackground, other.logoBackground),
      footerText: one(footerText, other.footerText),
    );
  }
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
  static final ThemeData lightTheme = _build(
    const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF8745D4),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFB03A7A),
      onSecondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFF5B45B8),
      onTertiary: Color(0xFFFFFFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFBFF),
      onSurface: Color(0xFF302052),
      onSurfaceVariant: Color(0xFF625578),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFFAF4FF),
      surfaceContainer: Color(0xFFF5EEFD),
      surfaceContainerHigh: Color(0xFFF0E3FF),
      surfaceContainerHighest: Color(0xFFEDE0FF),
      outline: Color(0xFF75668C),
      outlineVariant: Color(0xFFDEC8F2),
      shadow: Color(0x22302052),
      scrim: Color(0x80000000),
      inverseSurface: Color(0xFF302052),
      onInverseSurface: Color(0xFFFFFBFF),
    ),
    const SiteColors(
      heroGradient: [Color(0xFFFFF8FC), Color(0xFFF0E6FF), Color(0xFFFFE6F2)],
      cardGradient: [Color(0xFFFAF4FF), Color(0xFFF0E3FF), Color(0xFFFFF4FA)],
      softCardGradient: [Color(0xFFFFFFFF), Color(0xFFF5EAFF)],
      frameGradient: [Color(0xFFFFD8EE), Color(0xFFE5D2FF), Color(0xFFF9EAFB)],
      mascotGradient: [Color(0xFFECD4FF), Color(0xFFFBE1F2), Color(0xFFE4D8FF)],
      iconGradient: [Color(0xFFB866F3), Color(0xFF7938C7)],
      ctaGradient: [Color(0xFF60309F), Color(0xFF7D3FC4), Color(0xFF9A50D0)],
      footerGradient: [Color(0xFF39235D), Color(0xFF5D338D)],
      accents: {
        AppAccent.doska: Color(0xFF8A4590),
        AppAccent.timeFiller: Color(0xFF00705A),
        AppAccent.clipInk: Color(0xFF2C5BC0),
      },
      blogAccents: [
        Color(0xFFE9D8FF),
        Color(0xFFFFDBE9),
        Color(0xFFD8E4FF),
        Color(0xFFE4D7FF),
      ],
      iconTile: Color(0xFFF0DDFF),
      cardBorder: Color(0xFFE8D6F8),
      glow: Color(0x148745D4),
      windowBar: Color(0xFFFDFBFF),
      windowBackground: Color(0xFFF5F0FC),
      logoBackground: Color(0xFFFFFFFF),
      footerText: Color(0xFFE7D7F8),
    ),
    const AppImages(
      imagesDir: 'assets/images/light',
      screenshotsDir: 'assets/screenshots/light',
    ),
  );

  static final ThemeData darkTheme = _build(
    const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFCFA8FF),
      onPrimary: Color(0xFF2A1550),
      secondary: Color(0xFFFFB5D8),
      onSecondary: Color(0xFF3D1230),
      tertiary: Color(0xFFB9ADFF),
      onTertiary: Color(0xFF221452),
      error: Color(0xFFFF8A8A),
      onError: Color(0xFF3B0A0A),
      surface: Color(0xFF1C1430),
      onSurface: Color(0xFFF3ECFF),
      onSurfaceVariant: Color(0xFFC9BBDF),
      surfaceContainerLowest: Color(0xFF17102A),
      surfaceContainerLow: Color(0xFF241A3C),
      surfaceContainer: Color(0xFF2A1F45),
      surfaceContainerHigh: Color(0xFF32264F),
      surfaceContainerHighest: Color(0xFF3B2E5C),
      outline: Color(0xFFAB9CC4),
      outlineVariant: Color(0xFF4D3F6E),
      shadow: Color(0x55000000),
      scrim: Color(0x99000000),
      inverseSurface: Color(0xFFF3ECFF),
      onInverseSurface: Color(0xFF1C1430),
    ),
    const SiteColors(
      heroGradient: [Color(0xFF1C1430), Color(0xFF2A1B4A), Color(0xFF38193F)],
      cardGradient: [Color(0xFF261B40), Color(0xFF2E2150), Color(0xFF2F1C40)],
      softCardGradient: [Color(0xFF2A1F45), Color(0xFF32264F)],
      frameGradient: [Color(0xFF5A2C55), Color(0xFF47306F), Color(0xFF4D2E5C)],
      mascotGradient: [Color(0xFF3B2A63), Color(0xFF4A2748), Color(0xFF33285F)],
      iconGradient: [Color(0xFFB866F3), Color(0xFF7938C7)],
      ctaGradient: [Color(0xFF4B2482), Color(0xFF6A34AB), Color(0xFF8344B8)],
      footerGradient: [Color(0xFF150E26), Color(0xFF2B1A4B)],
      accents: {
        AppAccent.doska: Color(0xFFD08FD6),
        AppAccent.timeFiller: Color(0xFF00B894),
        AppAccent.clipInk: Color(0xFF6C9EFF),
      },
      blogAccents: [
        Color(0xFF3E2C66),
        Color(0xFF532A4C),
        Color(0xFF2C3766),
        Color(0xFF3A2E6B),
      ],
      iconTile: Color(0xFF3F2E66),
      cardBorder: Color(0xFF4A3A68),
      glow: Color(0x33000000),
      windowBar: Color(0xFF32264F),
      windowBackground: Color(0xFF211735),
      logoBackground: Color(0xFFF5F0FC),
      footerText: Color(0xFFD9C9EE),
    ),
    const AppImages(
      imagesDir: 'assets/images/dark',
      screenshotsDir: 'assets/screenshots/dark',
    ),
  );

  static ThemeData _build(
    ColorScheme scheme,
    SiteColors colors,
    AppImages images,
  ) {
    const buttonText = TextStyle(fontWeight: FontWeight.w700);
    const buttonPadding = EdgeInsets.symmetric(horizontal: 23, vertical: 18);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(height: 1.45),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: buttonPadding,
          minimumSize: const Size(44, 44),
          shape: const StadiumBorder(),
          textStyle: buttonText,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          padding: buttonPadding,
          minimumSize: const Size(44, 44),
          shape: const StadiumBorder(),
          side: BorderSide(color: scheme.primary),
          textStyle: buttonText,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          minimumSize: const Size(44, 44),
          textStyle: buttonText,
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        iconColor: scheme.primary,
        collapsedIconColor: scheme.primary,
        textColor: scheme.onSurface,
        collapsedTextColor: scheme.onSurface,
        shape: const Border(),
        collapsedShape: const Border(),
      ),
      extensions: [colors, images],
    );
  }
}
