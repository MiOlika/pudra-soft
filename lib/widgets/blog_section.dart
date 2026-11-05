import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/app_theme.dart';
import 'site_common.dart';

class _Post {
  final String tag;
  final String title;
  final String summary;
  final String content;
  final IconData icon;

  const _Post(this.tag, this.title, this.summary, this.content, this.icon);
}

/// Блог: статьи открываются прямо на странице.
class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context);
    final posts = [
      _Post(s.blog1Tag, s.blog1Title, s.blog1Summary, s.blog1Content,
          Icons.auto_stories_rounded),
      _Post(s.blog2Tag, s.blog2Title, s.blog2Summary, s.blog2Content,
          Icons.hourglass_bottom_rounded),
      _Post(s.blog3Tag, s.blog3Title, s.blog3Summary, s.blog3Content,
          Icons.dashboard_customize_rounded),
      _Post(s.blog4Tag, s.blog4Title, s.blog4Summary, s.blog4Content,
          Icons.bar_chart_rounded),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(eyebrow: s.blogEyebrow),
        ResponsiveGrid(
          wideColumns: 4,
          wideFrom: 1050,
          children: [
            for (var i = 0; i < posts.length; i++)
              _BlogCard(post: posts[i], index: i),
          ],
        ),
      ],
    );
  }
}

class _BlogCard extends StatelessWidget {
  final _Post post;
  final int index;

  const _BlogCard({required this.post, required this.index});

  void _open(BuildContext context) {
    final strings = AppLocalizations.of(context);
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(post.title),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: SingleChildScrollView(
            child: Text(post.content, style: const TextStyle(height: 1.6)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(strings.close),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final colors = SiteColors.of(context);
    final accent = colors.blogAccents[index % colors.blogAccents.length];

    return Material(
      color: scheme.surfaceContainerLowest,
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: BorderSide(color: colors.cardBorder),
      ),
      child: InkWell(
        onTap: () => _open(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [accent, scheme.surfaceContainerLow],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 20,
                    top: 18,
                    child: Icon(
                      post.icon,
                      size: 70,
                      color: scheme.primary.withValues(alpha: 0.75),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: scheme.surface.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        post.tag,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: scheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.2,
                      fontWeight: FontWeight.w900,
                      color: scheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.summary,
                    style: TextStyle(
                      fontSize: 14,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Text(
                        strings.readMore,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: scheme.primary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 16,
                        color: scheme.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
