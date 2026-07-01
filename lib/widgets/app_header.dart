import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      // decoration: const BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(
      //       // color: AppConstants.backgroundColor,
      //     ),
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'PS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
