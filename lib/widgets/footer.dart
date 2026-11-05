import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';
import 'site_common.dart';

/// Подвал сайта.
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final colors = SiteColors.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors.footerGradient,
        ),
      ),
      child: SectionShell(
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.asset(
                        AppImages.of(context).image('pudra_soft_logo.png'),
                        width: 35,
                        height: 35,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Pudra Soft',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  height: 1.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        colors.footerText.withValues(alpha: 0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _FooterButton(
                      icon: Icons.people,
                      label: strings.vkGroup,
                      url: AppConstants.vkUrl,
                    ),
                    _FooterButton(
                      icon: Icons.mark_unread_chat_alt,
                      label: strings.maxChannel,
                      url: AppConstants.maxUrl,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  strings.copyright,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colors.footerText, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  strings.footerNote,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colors.footerText, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const _FooterButton({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final color = SiteColors.of(context).footerText;

    return OutlinedButton.icon(
      onPressed: () => LinkLauncher.launchUrlString(url),
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color.withValues(alpha: 0.7)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
