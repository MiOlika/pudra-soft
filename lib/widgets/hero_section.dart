import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'border_painter.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: isMobile ? 40 : 60,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/banner.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          child: CustomPaint(
            painter: BorderPainter(_animation.value, colorScheme),
            child: Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 24,
                vertical: isMobile ? 40 : 60,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.surface.withValues(alpha: 0.4),
                    colorScheme.surfaceBright.withValues(alpha: 0.6),
                    colorScheme.surface.withValues(alpha: 0.4),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Логотип компании
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      // Синусоида от -1 до 1, преобразуем в 0-1
                      final sinValue =
                          math.sin(_controller.value * 2 * math.pi);
                      // Масштаб: 1.0 +/- 0.05 (от 0.95 до 1.05)
                      final scale = 1.0 + 0.05 * sinValue;

                      return Transform.scale(
                        scale: scale,
                        child: SizedBox(
                          width: isMobile ? 60 : 80,
                          height: isMobile ? 60 : 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/pudra_soft_logo.png',
                            ),
                          ),
                        ),
                      );
                    },
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
                          Colors.transparent,
                          colorScheme.primary,
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: isMobile ? 0 : 40),
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
                      horizontal: isMobile ? 16 : 20,
                      vertical: isMobile ? 10 : 12,
                    ),
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
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
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
          ),
        );
      },
    );
  }
}
