import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceDim,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () =>
                    LinkLauncher.launchUrlString(AppConstants.vkUrl),
                icon: const Icon(Icons.people, size: 18),
                label: const Text('Группа ВКонтакте'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white70,
                ),
              ),
            ],
          ),
          const Divider(color: Colors.grey, height: 32),
          const Text(
            '© 2026 Pudra Soft. Все права защищены.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Приложения работают полностью локально. Ваши данные — только на вашем компьютере.',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
