import 'package:flutter/material.dart';
import 'package:pudra_soft/widgets/partner_card.dart';

import '../utils/partners.dart';
import 'custom_separator.dart';

class PartnerSection extends StatelessWidget {
  const PartnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: colorScheme.surfaceDim,
        ),
        child: Column(
          children: [
            const CustomSeparator(),
            const SizedBox(height: 16),
            Text(
              'Партнеры',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 22 : null,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Определяем ширину карточки в зависимости от размера экрана
                  double cardWidth;
                  if (constraints.maxWidth > 1100) {
                    cardWidth = (constraints.maxWidth - 40) / 3; // 3 колонки
                  } else if (constraints.maxWidth > 700) {
                    cardWidth = (constraints.maxWidth - 20) / 2; // 2 колонки
                  } else {
                    cardWidth = constraints.maxWidth; // 1 колонка
                  }

                  return Wrap(
                    spacing: 20, // Горизонтальный отступ
                    runSpacing: 20, // Вертикальный отступ
                    alignment: WrapAlignment.center,
                    children: Partners.partners.map((partner) {
                      return SizedBox(
                        width: cardWidth,
                        child: PartnerCard(partner: partner),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            const CustomSeparator(),
          ],
        ));
  }
}
