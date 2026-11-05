import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../models/app_release.dart';
import '../utils/constants.dart';
import 'app_releases_builder.dart';

/// Список версий приложения со ссылками на скачивание.
class VersionsSection extends StatefulWidget {
  final AppReleases releases;

  const VersionsSection({super.key, required this.releases});

  @override
  State<VersionsSection> createState() => _VersionsSectionState();
}

class _VersionsSectionState extends State<VersionsSection> {
  static const int _collapsedCount = 5;

  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final releases = widget.releases;
    final accent = releases.app.accentColor(context);
    final strings = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    if (releases.isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2, color: accent),
            ),
            const SizedBox(width: 12),
            Text(
              strings.loadingVersions,
              style: TextStyle(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      );
    }

    final all = releases.all;
    final visible =
        _showAll ? all : all.take(_collapsedCount).toList(growable: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (all.isEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              releases.hasError
                  ? strings.versionsError(releases.version)
                  : strings.noVersions,
              style: TextStyle(
                color: colorScheme.onSurfaceVariant,
                fontSize: 14.5,
                height: 1.5,
              ),
            ),
          ),
        ...visible.map(
          (release) => _ReleaseTile(
            release: release,
            isLatest: identical(release, releases.latest),
            accent: accent,
          ),
        ),
        Wrap(
          spacing: 8,
          children: [
            if (all.length > _collapsedCount)
              TextButton(
                onPressed: () => setState(() => _showAll = !_showAll),
                style: TextButton.styleFrom(foregroundColor: accent),
                child: Text(
                  _showAll ? strings.collapse : strings.showAllVersions(all.length),
                ),
              ),
            TextButton.icon(
              onPressed: () =>
                  LinkLauncher.launchUrlString(releases.app.releasesUrl),
              icon: const Icon(Icons.open_in_new_rounded, size: 16),
              label: Text(strings.allReleasesOnGithub),
              style: TextButton.styleFrom(foregroundColor: accent),
            ),
          ],
        ),
      ],
    );
  }
}

class _ReleaseTile extends StatelessWidget {
  final AppRelease release;
  final bool isLatest;
  final Color accent;

  const _ReleaseTile({
    required this.release,
    required this.isLatest,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final strings = AppLocalizations.of(context);
    final publishedAt = release.publishedAt;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isLatest
              ? accent.withValues(alpha: 0.4)
              : colorScheme.outlineVariant,
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 10,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            runSpacing: 6,
            children: [
              Text(
                strings.version(release.version),
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (isLatest) _Badge(label: strings.latestBadge, color: accent),
              if (release.isPrerelease)
                _Badge(label: strings.prereleaseBadge, color: colorScheme.outline),
              if (publishedAt != null)
                Text(
                  strings.releaseDate(publishedAt.toLocal()),
                  style: TextStyle(color: colorScheme.outline, fontSize: 13),
                ),
            ],
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              TextButton(
                onPressed: () => LinkLauncher.launchUrlString(release.pageUrl),
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.outline,
                ),
                child: Text(strings.whatsNew),
              ),
              if (release.assets.isEmpty)
                _downloadButton(label: strings.openRelease, url: release.pageUrl),
              ...release.assets.map(
                (asset) => _downloadButton(
                  label: release.assets.length > 1
                      ? '${asset.extension.toUpperCase()}, '
                          '${strings.fileSize(asset.sizeInMb)}'
                      : strings.downloadWithSize(strings.fileSize(asset.sizeInMb)),
                  url: asset.downloadUrl,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _downloadButton({required String label, required String url}) {
    return OutlinedButton.icon(
      onPressed: () => LinkLauncher.launchUrlString(url),
      icon: const Icon(Icons.download_rounded, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: accent,
        side: BorderSide(color: accent),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
