import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 24, vertical: isMobile ? 40 : 60),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/banner.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24, vertical: isMobile ? 40 : 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.surface.withValues(alpha: 0.5),
              colorScheme.surfaceBright.withValues(alpha: 0.9),
              colorScheme.surface.withValues(alpha: 0.5),
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
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
              ),
              child: Center(
                child: Text(
                  'PS',
                  style: TextStyle(
                    color: colorScheme.onPrimary,
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
                    color: colorScheme.onSurface,
                    fontSize: isMobile ? 28 : null,
                  ),
            ),
            const SizedBox(height: 16),
            Container(
              width: screenWidth,
              height: 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.transparent, // Слева прозрачный
                    colorScheme.primary, // В центре цвет primary
                    Colors.transparent, // Справа прозрачный
                  ],
                  stops: const [0.0, 0.5, 1.0], // Равномерное распределение
                ),
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
                      color: colorScheme.onSurfaceVariant,
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
                color: colorScheme.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: colorScheme.onSurface,
                    size: isMobile ? 16 : 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isMobile
                        ? 'Бесплатно • Без подписки'
                        : 'Бесплатно • Без подписки • Полная автономность',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontSize: isMobile ? 12 : null,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
