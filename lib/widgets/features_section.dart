import 'package:flutter/material.dart';

import '../utils/constants.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    // Вычисляем ширину карточки
    double getCardWidth() {
      if (isMobile) {
        // На мобильных: 2 колонки с отступами
        return (screenWidth - 48) / 2;
      }
      // На десктопе: 3 колонки
      return (screenWidth - 72) / 3;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 32 : 40,
      ),
      color: isDark ? Colors.grey[850] : Colors.grey[50],
      child: Column(
        children: [
          Text(
            'Почему выбирают нас',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 22 : null,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            isMobile
                ? 'Приложения от Pudra Soft для продуктивной работы\nс полной приватностью'
                : 'Приложения от Pudra Soft созданы для продуктивной работы\nс полной приватностью ваших данных',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                  fontSize: isMobile ? 14 : null,
                ),
          ),
          const SizedBox(height: 32),

          // Используем Wrap для автоматического переноса
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: AppConstants.features.map((feature) {
              return SizedBox(
                width: getCardWidth(),
                child: Card(
                  elevation: 0,
                  color: isDark ? Colors.grey[800] : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 12 : 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          feature['icon']!,
                          style: TextStyle(
                            fontSize: isMobile ? 28 : 32,
                          ),
                        ),
                        SizedBox(height: isMobile ? 6 : 8),
                        Text(
                          feature['title']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: isMobile ? 14 : 16,
                          ),
                        ),
                        SizedBox(height: isMobile ? 4 : 8),
                        Text(
                          feature['description']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                            fontSize: isMobile ? 12 : 13,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
