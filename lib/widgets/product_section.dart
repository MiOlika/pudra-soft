import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../models/app_model.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';
import 'app_releases_builder.dart';
import 'product_card.dart';
import 'site_common.dart';

/// Раздел приложений: кнопки выбора и карточка выбранного приложения.
class ProductSection extends StatefulWidget {
  const ProductSection({super.key});

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final apps = AppConstants.appsFor(strings);
    final selected = apps[_selectedIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(eyebrow: strings.productsEyebrow),
        Row(
          children: [
            for (var i = 0; i < apps.length; i++) ...[
              if (i > 0) const SizedBox(width: 10),
              Expanded(
                child: _AppTile(
                  app: apps[i],
                  isSelected: i == _selectedIndex,
                  onTap: () => setState(() => _selectedIndex = i),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 24),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          layoutBuilder: (current, previous) => Stack(
            alignment: Alignment.topCenter,
            children: [...previous, if (current != null) current],
          ),
          child: ProductCard(key: ValueKey(selected.id), app: selected),
        ),
      ],
    );
  }
}

/// Вкладка приложения: на компьютере значок и подписи идут в строку,
/// на телефоне друг под другом, чтобы три вкладки помещались в ряд.
class _AppTile extends StatelessWidget {
  final AppModel app;
  final bool isSelected;
  final VoidCallback onTap;

  const _AppTile({
    required this.app,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colors = SiteColors.of(context);
    final accent = app.accentColor(context);
    final isPhone = MediaQuery.sizeOf(context).width < 600;
    final radius = BorderRadius.circular(16);

    final logo = Container(
      width: 44,
      height: 44,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: isSelected ? 0.18 : 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(
        app.logoPath(context),
        errorBuilder: (_, __, ___) => Icon(app.fallbackIcon, color: accent),
      ),
    );
    final name = Text(
      app.title,
      textAlign: isPhone ? TextAlign.center : TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w800,
        color: scheme.onSurface,
      ),
    );
    final version = AppReleasesBuilder(
      app: app,
      builder: (context, releases) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: accent.withValues(alpha: isSelected ? 0.18 : 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          releases.version,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: isSelected ? scheme.onSurface : scheme.onSurfaceVariant,
          ),
        ),
      ),
    );

    return Semantics(
      button: true,
      selected: isSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: isSelected
              ? accent.withValues(alpha: 0.1)
              : scheme.surfaceContainerLow,
          border: Border.all(
            color: isSelected ? accent.withValues(alpha:0.5) : colors.cardBorder,
            width: isSelected ? 1.0 : 1.0,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: radius,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: isPhone
                  ? Column(
                      children: [
                        logo,
                        const SizedBox(height: 6),
                        name,
                        const SizedBox(height: 4),
                        version,
                      ],
                    )
                  : Row(
                      children: [
                        logo,
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              name,
                              const SizedBox(height: 3),
                              version,
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
