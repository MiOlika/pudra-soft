import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
              Text(
                'Pudra Soft',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.support_agent),
                color: Colors.grey,
                onPressed: () =>
                    LinkLauncher.launchUrlString(AppConstants.vkUrl),
                tooltip: 'Поддержка ВКонтакте',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
