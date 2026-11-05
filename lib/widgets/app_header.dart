import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';
import 'settings_controls.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
              SizedBox(
                width: 35,
                height: 35,
                child: ClipRRect(
                  child: Image.asset(
                    AppImages.of(context).image('pudra_soft_logo.png'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  'Pudra Soft',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ],
            ),
          ),
          Row(
            children: [
              const SettingsControls(),
              IconButton(
                icon: const Icon(Icons.support_agent),
                color: Theme.of(context).colorScheme.outline,
                onPressed: () =>
                    LinkLauncher.launchUrlString(AppConstants.vkUrl),
                tooltip: AppLocalizations.of(context).supportTooltip,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
