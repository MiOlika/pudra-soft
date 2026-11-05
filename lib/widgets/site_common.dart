import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

/// Ширина, начиная с которой блоки выстраиваются в колонки.
const double kWideLayout = 760;

/// Боковой отступ контента на компьютере и на телефоне.
double sidePadding(double width) => width < 600 ? 16 : 24;

/// Ограничивает ширину раздела и задаёт боковые отступы.
class SectionShell extends StatelessWidget {
  final Widget child;

  const SectionShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final padding = sidePadding(MediaQuery.sizeOf(context).width);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: child,
        ),
      ),
    );
  }
}

/// Отступ между разделами.
class SectionGap extends StatelessWidget {
  const SectionGap({super.key});

  @override
  Widget build(BuildContext context) {
    final isPhone = MediaQuery.sizeOf(context).width < 600;
    return SizedBox(height: isPhone ? 52 : 80);
  }
}

/// Заголовок раздела: фиолетовая подпись по центру.
class Eyebrow extends StatelessWidget {
  final String text;

  const Eyebrow(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final isPhone = MediaQuery.sizeOf(context).width < 600;
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: isPhone ? 15 : 17,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w800,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

/// Шапка раздела: заголовок и необязательное пояснение.
class SectionTitle extends StatelessWidget {
  final String eyebrow;
  final String? subtitle;

  const SectionTitle({super.key, required this.eyebrow, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Eyebrow(eyebrow),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}

/// Квадрат со значком в фирменном стиле.
class IconTile extends StatelessWidget {
  final IconData icon;
  final double size;

  const IconTile({super.key, required this.icon, this.size = 53});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: SiteColors.of(context).iconTile,
        borderRadius: BorderRadius.circular(size * 0.32),
      ),
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
        size: size * 0.55,
      ),
    );
  }
}

/// Сетка карточек с числом колонок по доступной ширине.
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;

  /// Колонок на широком экране и на среднем; на узком всегда одна.
  final int wideColumns;
  final int mediumColumns;
  final double wideFrom;
  final double mediumFrom;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.wideColumns = 3,
    this.mediumColumns = 2,
    this.wideFrom = 960,
    this.mediumFrom = 560,
  });

  @override
  Widget build(BuildContext context) {
    const gap = 16.0;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width >= wideFrom
            ? wideColumns
            : width >= mediumFrom
                ? mediumColumns
                : 1;
        final itemWidth = (width - gap * (columns - 1)) / columns;
        // Wrap сжимается по содержимому, поэтому ширину задаём явно:
        // иначе неполный ряд прижимается к левому краю.
        return SizedBox(
          width: width,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: gap,
            runSpacing: gap,
            children: [
              for (final child in children)
                SizedBox(width: itemWidth, child: child),
            ],
          ),
        );
      },
    );
  }
}
