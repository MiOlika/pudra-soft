import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/app_theme.dart';
import '../utils/site_navigation.dart';
import 'settings_controls.dart';
import 'site_common.dart';

/// Закреплённая шапка сайта.
class SiteHeader extends StatelessWidget {
  const SiteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final colors = SiteColors.of(context);
    final links = {
      SiteSection.products: strings.navProducts,
      SiteSection.benefits: strings.navBenefits,
      SiteSection.about: strings.navAbout,
      SiteSection.blog: strings.navBlog,
    };

    return Material(
      color: scheme.surface,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colors.cardBorder)),
        ),
        child: SafeArea(
          bottom: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1240),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final wide = constraints.maxWidth >= 980;
                  final padding = sidePadding(constraints.maxWidth);
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: padding,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: _Brand(
                                showTagline: constraints.maxWidth >= 420)),
                        if (wide) ...[
                          for (final link in links.entries)
                            TextButton(
                              onPressed: () => SiteNavigation.goTo(link.key),
                              style: TextButton.styleFrom(
                                foregroundColor: scheme.onSurface,
                              ),
                              child: Text(link.value),
                            ),
                          const SizedBox(width: 8),
                        ],
                        const SettingsControls(),
                        if (wide) ...[
                          const SizedBox(width: 8),
                          FilledButton(
                            onPressed: () =>
                                SiteNavigation.goTo(SiteSection.contacts),
                            child: Text(strings.contactUs),
                          ),
                        ] else
                          IconButton(
                            icon: const Icon(Icons.menu_rounded),
                            color: scheme.onSurface,
                            tooltip: strings.menuTooltip,
                            onPressed: () => _showMenu(context),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final items = {
      SiteSection.products: (strings.navProducts, Icons.apps_rounded),
      SiteSection.benefits: (strings.navBenefits, Icons.star_outline_rounded),
      SiteSection.about: (strings.navAbout, Icons.info_outline_rounded),
      SiteSection.blog: (strings.navBlog, Icons.article_outlined),
      SiteSection.contacts: (strings.navContacts, Icons.forum_outlined),
    };

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final item in items.entries)
              ListTile(
                leading: Icon(item.value.$2),
                title: Text(item.value.$1),
                onTap: () {
                  Navigator.pop(sheetContext);
                  SiteNavigation.goTo(item.key);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  final bool showTagline;

  const _Brand({required this.showTagline});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            AppImages.of(context).image('pudra_soft_logo.png'),
            width: 40,
            height: 40,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pudra Soft',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w900,
                  color: scheme.onSurface,
                ),
              ),
              if (showTagline)
                Text(
                  AppLocalizations.of(context).brandTagline,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: scheme.outline),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
