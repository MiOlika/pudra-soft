import 'package:flutter/material.dart';

class AppTheme {
  // Темная тема с приятной светлой цветовой палитрой
  static ThemeData darkTheme = ThemeData(
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
      outline: Color(0xFF8A8AB0),
      outlineVariant: Color(0xFF55557A),

      // Тени и инверсные поверхности
      shadow: Color(0x33000000),
      inverseSurface: Color(0xFFF5F3FF),
      onInverseSurface: Color(0xFF1A1A2E),

      // Третичный цвет - мятно-голубой для акцентов
      tertiary: Color(0xFF8DD4E8),
      onTertiary: Color(0xFF1A1A2E),

      // Поверхности для диммера
      surfaceDim: Color(0xFF1A1A30),
      surfaceBright: Color(0xFF4A4A70),

      // Затемнение
      scrim: Color(0x80000000),
    ),
  );
}
