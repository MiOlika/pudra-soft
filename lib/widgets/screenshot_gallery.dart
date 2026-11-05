import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../models/app_model.dart';
import '../utils/app_theme.dart';

/// Галерея скриншотов в рамке окна. На телефоне листается пальцем,
/// на компьютере кнопками. По нажатию скриншот открывается на весь экран.
class ScreenshotGallery extends StatefulWidget {
  final AppModel app;

  const ScreenshotGallery({super.key, required this.app});

  @override
  State<ScreenshotGallery> createState() => _ScreenshotGalleryState();
}

class _ScreenshotGalleryState extends State<ScreenshotGallery> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOut,
    );
  }

  void _openFullScreen(String path, String label) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => Dialog.fullscreen(
        backgroundColor: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            InteractiveViewer(
              maxScale: 4,
              child: Image.asset(path, semanticLabel: label),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: IconButton.filledTonal(
                    tooltip: AppLocalizations.of(context).close,
                    onPressed: () => Navigator.pop(dialogContext),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final colors = SiteColors.of(context);
    final app = widget.app;
    final images = app.screenshots(context);

    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: scheme.shadow,
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 33,
                color: colors.windowBar,
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  children: [
                    for (final dot in const [
                      Color(0xFFFFB2C6),
                      Color(0xFFFFDFA0),
                      Color(0xFFBFE8CD),
                    ]) ...[
                      Icon(Icons.circle, size: 9, color: dot),
                      const SizedBox(width: 5),
                    ],
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        images.isEmpty
                            ? app.title
                            : '${app.title}  /  ${_index + 1} – ${images.length}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: scheme.onSurface,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ColoredBox(
                  color: colors.windowBackground,
                  child: images.isEmpty
                      ? _Placeholder(app: app)
                      : Stack(
                          fit: StackFit.expand,
                          children: [
                            PageView.builder(
                              controller: _controller,
                              itemCount: images.length,
                              onPageChanged: (index) =>
                                  setState(() => _index = index),
                              itemBuilder: (context, index) {
                                final label = strings.screenshotLabel(
                                  app.title,
                                  index + 1,
                                );
                                return Semantics(
                                  button: true,
                                  label: label,
                                  child: InkWell(
                                    onTap: () => _openFullScreen(
                                      images[index],
                                      label,
                                    ),
                                    child: Image.asset(
                                      images[index],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                );
                              },
                            ),
                            if (_index > 0)
                              _Arrow(
                                alignment: Alignment.centerLeft,
                                icon: Icons.chevron_left_rounded,
                                tooltip: strings.previousScreenshot,
                                onPressed: () => _goTo(_index - 1),
                              ),
                            if (_index < images.length - 1)
                              _Arrow(
                                alignment: Alignment.centerRight,
                                icon: Icons.chevron_right_rounded,
                                tooltip: strings.nextScreenshot,
                                onPressed: () => _goTo(_index + 1),
                              ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        if (images.length > 1) ...[
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < images.length; i++)
                Semantics(
                  button: true,
                  selected: i == _index,
                  label: strings.screenshotLabel(app.title, i + 1),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => _goTo(i),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: i == _index ? 24 : 9,
                        height: 9,
                        decoration: BoxDecoration(
                          color: i == _index
                              ? app.accentColor(context)
                              : scheme.outlineVariant,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

class _Arrow extends StatelessWidget {
  final Alignment alignment;
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _Arrow({
    required this.alignment,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: IconButton(
          tooltip: tooltip,
          onPressed: onPressed,
          color: Colors.white,
          style: IconButton.styleFrom(
            backgroundColor: Colors.black.withValues(alpha: 0.5),
          ),
          icon: Icon(icon),
        ),
      ),
    );
  }
}

/// Заглушка для приложения, у которого ещё нет скриншотов.
class _Placeholder extends StatelessWidget {
  final AppModel app;

  const _Placeholder({required this.app});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colors = SiteColors.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors.mascotGradient,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(app.fallbackIcon, size: 56, color: app.accentColor(context)),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context).screenshotsSoon,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: scheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
