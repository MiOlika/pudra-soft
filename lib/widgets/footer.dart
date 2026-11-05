import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';
import 'custom_separator.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final strings = AppLocalizations.of(context);
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
                    AppImages.of(context).image('pudra_soft_logo.png'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Pudra Soft',
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const CustomSeparator(),
          const SizedBox(height: 16),
          Wrap(spacing: 10, children: [
            OutlinedButton.icon(
              onPressed: () => LinkLauncher.launchUrlString(AppConstants.vkUrl),
              icon: const Icon(Icons.people, size: 18),
              label: Text(strings.vkGroup),
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.outline,
                side: BorderSide(color: colorScheme.outline),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () =>
                  LinkLauncher.launchUrlString(AppConstants.maxUrl),
              icon: const Icon(Icons.mark_unread_chat_alt, size: 18),
              label: Text(strings.maxChannel),
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.outline,
                side: BorderSide(color: colorScheme.outline),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ]),
          const SizedBox(height: 16),
          Text(
            strings.copyright,
            style: TextStyle(
              color: colorScheme.outline,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            strings.footerNote,
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
