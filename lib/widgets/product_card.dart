import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../models/app_model.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';
import 'app_releases_builder.dart';
import 'screenshot_gallery.dart';
import 'site_common.dart';
import 'versions_section.dart';

/// Карточка приложения: описание, скачивание, скриншоты и подробности.
class ProductCard extends StatelessWidget {
  final AppModel app;

  const ProductCard({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    final colors = SiteColors.of(context);
    final accent = app.accentColor(context);

    return AppReleasesBuilder(
      app: app,
      builder: (context, releases) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors.cardGradient,
          ),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: accent.withValues(alpha: 0.35)),
          boxShadow: [
            BoxShadow(
              color: accent.withValues(alpha: 0.1),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= kWideLayout;
            final info = _ProductInfo(app: app, releases: releases, wide: wide);
            final gallery = ScreenshotGallery(app: app);

            return Padding(
              padding: EdgeInsets.all(wide ? 26 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (wide)
                    Row(
                      children: [
                        Expanded(flex: 38, child: info),
                        const SizedBox(width: 24),
                        Expanded(flex: 62, child: gallery),
                      ],
                    )
                  else ...[
                    info,
                    const SizedBox(height: 20),
                    gallery,
                  ],
                  const SizedBox(height: 18),
                  _ProductDetails(app: app, releases: releases),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  final AppModel app;
  final AppReleases releases;
  final bool wide;

  const _ProductInfo({
    required this.app,
    required this.releases,
    required this.wide,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final accent = app.accentColor(context);
    final video = app.videoUrl;

    final download = FilledButton.icon(
      onPressed: () => LinkLauncher.launchUrlString(releases.downloadUrl),
      icon: const Icon(Icons.download_rounded),
      label: Text(strings.downloadFree),
      style: FilledButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: scheme.onPrimary,
      ),
    );
    final watch = video == null
        ? null
        : OutlinedButton.icon(
            onPressed: () => LinkLauncher.launchUrlString(video),
            icon: const Icon(Icons.play_arrow_rounded),
            label: Text(strings.watchVideo),
            style: OutlinedButton.styleFrom(
              foregroundColor: accent,
              side: BorderSide(color: accent),
            ),
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(17),
                border: Border.all(color: accent.withValues(alpha: 0.2)),
              ),
              child: Image.asset(
                app.logoPath(context),
                errorBuilder: (_, __, ___) => Icon(
                  app.fallbackIcon,
                  color: accent,
                  size: 34,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Flexible(
              child: Text(
                app.title,
                style: TextStyle(
                  fontSize: wide ? 34 : 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                  color: scheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          app.subtitle,
          style: TextStyle(
            fontSize: 18,
            height: 1.3,
            fontWeight: FontWeight.w700,
            color: accent,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          app.description,
          style: TextStyle(
            fontSize: 14,
            height: 1.55,
            color: scheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        for (final feature in app.features)
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: accent,
                  size: 18,
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    feature,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: scheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 12),
        if (wide)
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [download, if (watch != null) watch],
          )
        else ...[
          SizedBox(width: double.infinity, child: download),
          if (watch != null) ...[
            const SizedBox(height: 10),
            SizedBox(width: double.infinity, child: watch),
          ],
        ],
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(
              Icons.desktop_windows_outlined,
              size: 14,
              color: scheme.outline,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                strings.versionForWindows(releases.version),
                style: TextStyle(fontSize: 12, color: scheme.outline),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Подробности сворачиваются, чтобы страница оставалась короткой на телефоне.
class _ProductDetails extends StatelessWidget {
  final AppModel app;
  final AppReleases releases;

  const _ProductDetails({required this.app, required this.releases});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final accent = app.accentColor(context);
    final textStyle = TextStyle(
      fontSize: 15,
      height: 1.6,
      color: scheme.onSurfaceVariant,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _DetailsPanel(
          accent: accent,
          icon: Icons.description_outlined,
          title: strings.descriptionTitle,
          children: [
            Text(app.detailedDescription, style: textStyle),
            const SizedBox(height: 16),
            for (final benefit in app.benefits)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_rounded, color: accent, size: 20),
                    const SizedBox(width: 8),
                    Expanded(child: Text(benefit, style: textStyle)),
                  ],
                ),
              ),
          ],
        ),
        _DetailsPanel(
          accent: accent,
          icon: Icons.history_rounded,
          title: strings.versionsTitle,
          children: [VersionsSection(releases: releases)],
        ),
        if (app.faqs.isNotEmpty)
          _DetailsPanel(
            accent: accent,
            icon: Icons.help_outline_rounded,
            title: strings.faqTitle,
            children: [
              for (final faq in app.faqs)
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        faq.question,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: scheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(faq.answer, style: textStyle),
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class _DetailsPanel extends StatelessWidget {
  final Color accent;
  final IconData icon;
  final String title;
  final List<Widget> children;

  const _DetailsPanel({
    required this.accent,
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colors = SiteColors.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: scheme.surface.withValues(alpha: 0.6),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colors.cardBorder),
        ),
        child: ExpansionTile(
          leading: Icon(icon, color: accent),
          iconColor: accent,
          collapsedIconColor: accent,
          title: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 14),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
