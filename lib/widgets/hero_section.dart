import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/app_theme.dart';
import '../utils/site_navigation.dart';
import 'site_common.dart';

/// Главный экран с маскотом.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final colors = SiteColors.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors.heroGradient,
        ),
      ),
      child: SectionShell(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= kWideLayout;
            final copy = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.heroTitle,
                  style: TextStyle(
                    fontSize: wide ? 52 : 36,
                    height: 1.08,
                    fontWeight: FontWeight.w900,
                    letterSpacing: wide ? -1.8 : -1,
                    color: scheme.onSurface,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  strings.heroSubtitle,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.55,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 25),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton(
                      onPressed: () =>
                          SiteNavigation.goTo(SiteSection.products),
                      child: Text(strings.heroActionProducts),
                    ),
                    OutlinedButton(
                      onPressed: () => SiteNavigation.goTo(SiteSection.about),
                      child: Text(strings.heroActionAbout),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  strings.heroBadge,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            );
            final art = Container(
              height: wide ? 430 : 300,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(wide ? 36 : 28),
                boxShadow: [BoxShadow(color: colors.glow, blurRadius: 36)],
              ),
              child: Image.asset(
                AppImages.of(context).image('mascot.jpg'),
                fit: BoxFit.cover,
                semanticLabel: strings.mascotLabel,
              ),
            );

            return Padding(
              padding: EdgeInsets.symmetric(vertical: wide ? 56 : 32),
              child: wide
                  ? Row(
                      children: [
                        Expanded(flex: 10, child: copy),
                        const SizedBox(width: 35),
                        Expanded(flex: 11, child: art),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [copy, const SizedBox(height: 30), art],
                    ),
            );
          },
        ),
      ),
    );
  }
}
