import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';
import 'app_releases_builder.dart';
import 'site_common.dart';

/// Призыв скачать приложения. Кнопки ведут на актуальные версии.
class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final colors = SiteColors.of(context);
    final apps = AppConstants.appsFor(strings);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors.ctaGradient),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: colors.glow,
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= kWideLayout;
          final heading = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strings.ctaTitle,
                style: TextStyle(
                  fontSize: wide ? 28 : 24,
                  height: 1.2,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                strings.ctaSubtitle,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          );
          final buttons = Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final app in apps) ...[
                AppReleasesBuilder(
                  app: app,
                  builder: (context, releases) => FilledButton.icon(
                    onPressed: () =>
                        LinkLauncher.launchUrlString(releases.downloadUrl),
                    icon: const Icon(Icons.download_rounded),
                    label: Text(strings.downloadApp(app.title)),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF302052),
                    ),
                  ),
                ),
                if (app != apps.last) const SizedBox(height: 10),
              ],
            ],
          );

          return Padding(
            padding: EdgeInsets.all(wide ? 34 : 22),
            child: wide
                ? Row(
                    children: [
                      Expanded(flex: 6, child: heading),
                      const SizedBox(width: 28),
                      Expanded(flex: 4, child: buttons),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [heading, const SizedBox(height: 22), buttons],
                  ),
          );
        },
      ),
    );
  }
}
