import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 24, vertical: isMobile ? 40 : 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  const Color(0xFF1A1A2E),
                  const Color(0xFF16213E),
                ]
              : [
                  const Color(0xFF6C63FF).withOpacity(0.1),
                  const Color(0xFF00B894).withOpacity(0.1),
                ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Логотип компании
          Container(
            width: isMobile ? 60 : 80,
            height: isMobile ? 60 : 80,
            decoration: BoxDecoration(
              color: const Color(0xFF6C63FF),
              borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
            ),
            child: Center(
              child: Text(
                'PS',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 24 : 32,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          Text(
            isMobile
                ? 'Локальное ПО для\nпродуктивной работы'
                : 'Локальное ПО для\nпродуктивной работы',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  fontSize: isMobile ? 28 : null,
                ),
          ),
          const SizedBox(height: 16),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 40),
            child: Text(
              isMobile
                  ? 'Бесплатные приложения для Windows,\nработающие полностью автономно'
                  : 'Бесплатные приложения для Windows, которые работают полностью автономно.\nВаши данные — только на вашем компьютере.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                    height: 1.5,
                    fontSize: isMobile ? 16 : null,
                  ),
            ),
          ),
          const SizedBox(height: 32),

          // Информационная плашка
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 20, vertical: isMobile ? 10 : 12),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[800] : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.info_outline,
                  size: isMobile ? 16 : 20,
                ),
                const SizedBox(width: 8),
                Text(
                  isMobile
                      ? 'Бесплатно • Без подписки'
                      : 'Бесплатно • Без подписки • Полная автономность',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12 : null,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
