import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/app_theme.dart';
import '../utils/site_navigation.dart';
import 'site_common.dart';

/// Раздел о подходе компании с маскотом.
class EcosystemSection extends StatelessWidget {
  const EcosystemSection({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final colors = SiteColors.of(context);

    final frame = Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors.frameGradient,
        ),
        borderRadius: BorderRadius.circular(34),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(31),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors.softCardGradient,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= kWideLayout;
            final copy = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.aboutText,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.55,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 23),
                _Step(
                  icon: Icons.dashboard_customize_rounded,
                  title: strings.aboutStep1Title,
                  detail: strings.aboutStep1Detail,
                ),
                const SizedBox(height: 16),
                _Step(
                  icon: Icons.calendar_month_rounded,
                  title: strings.aboutStep2Title,
                  detail: strings.aboutStep2Detail,
                ),
                const SizedBox(height: 16),
                _Step(
                  icon: Icons.videocam_rounded,
                  title: strings.aboutStep3Title,
                  detail: strings.aboutStep3Detail,
                ),
                const SizedBox(height: 23),
                OutlinedButton.icon(
                  onPressed: () => SiteNavigation.goTo(SiteSection.products),
                  icon: const Icon(Icons.apps_rounded),
                  label: Text(strings.heroActionProducts),
                ),
              ],
            );
            final visual = Container(
              height: wide ? 400 : 280,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
              ),
              child: Image.asset(
                AppImages.of(context).image('mascot.jpg'),
                fit: BoxFit.cover,
                semanticLabel: strings.mascotLabel,
              ),
            );

            return Padding(
              padding: EdgeInsets.all(wide ? 30 : 18),
              child: wide
                  ? Row(
                      children: [
                        Expanded(flex: 11, child: copy),
                        const SizedBox(width: 25),
                        Expanded(flex: 9, child: visual),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [copy, const SizedBox(height: 25), visual],
                    ),
            );
          },
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(eyebrow: strings.aboutEyebrow),
        frame,
      ],
    );
  }
}

class _Step extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;

  const _Step({required this.icon, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconTile(icon: icon, size: 43),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: scheme.onSurface,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                detail,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
