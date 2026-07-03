import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: BoxDecoration(
        color: colorScheme.surfaceDim,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 35,
                height: 35,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/pudra_soft_logo.png',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Pudra Soft',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 1.5,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent, // Слева прозрачный
                  colorScheme.outline, // В центре цвет primary
                  Colors.transparent, // Справа прозрачный
                ],
                stops: const [0.0, 0.5, 1.0], // Равномерное распределение
              ),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => LinkLauncher.launchUrlString(AppConstants.vkUrl),
            icon: const Icon(Icons.people, size: 18),
            label: const Text('Группа ВКонтакте'),
            style: OutlinedButton.styleFrom(
              foregroundColor: colorScheme.outline,
              side: BorderSide(color: colorScheme.outline),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '© 2026 Pudra Soft. Все права защищены.',
            style: TextStyle(
              color: colorScheme.outline,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Приложения работают полностью локально. Ваши данные — только на вашем компьютере.',
            style: TextStyle(
              color: colorScheme.outline,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
