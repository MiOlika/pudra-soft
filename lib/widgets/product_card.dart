import 'package:flutter/material.dart';
import 'package:pudra_soft/widgets/screenshot_gallery.dart';

import '../models/app_model.dart';
import '../utils/constants.dart';
import 'vk_video_player.dart';

class ProductCard extends StatefulWidget {
  final AppModel app;

  const ProductCard({super.key, required this.app});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final Set<int> _expandedFaqs = {};

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final app = widget.app;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        border: Border.all(color: colorScheme.outlineVariant, width: 1.5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: app.primaryColor.withValues(alpha: 0.08),
            blurRadius: 32,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Шапка с логотипом и названием
          _buildHeader(context, app, colorScheme, isMobile),
          const SizedBox(height: 28),

          // Видео демонстрация
          if (app.videoPath != null && app.videoPath!.isNotEmpty) ...[
            Center(
              child: VkVideoPlayer(
                accentColor: app.primaryColor,
                videoOwnerId: '-158779686',
                videoId: app.videoPath!,
                coverPath: app.screenshots[0],
              ),
            ),
            const SizedBox(height: 28),
          ],

          // Описание
          _buildSectionTitle(
            context,
            'Описание',
            Icons.description_outlined,
            app.primaryColor,
            colorScheme,
          ),
          const SizedBox(height: 12),
          Text(
            app.detailedDescription,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              height: 1.7,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 28),

          // Скриншоты
          if (app.screenshots.isNotEmpty) ...[
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : 800,
                ),
                child: ScreenshotGallery(
                  screenshots: app.screenshots,
                  accentColor: app.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 28),
          ],

          // Функции
          _buildSectionTitle(
            context,
            'Ключевые возможности',
            Icons.star_outline_rounded,
            app.primaryColor,
            colorScheme,
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: app.features.map((feature) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: app.primaryColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: app.primaryColor.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  feature,
                  style: TextStyle(
                    color: app.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 28),

          // Преимущества
          _buildSectionTitle(
            context,
            'Преимущества',
            Icons.thumb_up_outlined,
            app.primaryColor,
            colorScheme,
          ),
          const SizedBox(height: 14),
          ...app.benefits.map((benefit) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: app.primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: app.primaryColor,
                      size: 14,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      benefit,
                      style: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 28),

          // ---------------------- СЕКЦИЯ: FAQ ----------------------
          if (app.faqs.isNotEmpty) ...[
            _buildSectionTitle(
              context,
              'Часто задаваемые вопросы',
              Icons.help_outline_rounded,
              app.primaryColor,
              colorScheme,
            ),
            const SizedBox(height: 16),
            ...app.faqs.asMap().entries.map((entry) {
              final index = entry.key;
              final faq = entry.value;
              final isExpanded = _expandedFaqs.contains(index);

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isExpanded
                        ? app.primaryColor.withValues(alpha: 0.4)
                        : colorScheme.outlineVariant,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  child: ExpansionTile(
                    onExpansionChanged: (expanded) {
                      setState(() {
                        if (expanded) {
                          _expandedFaqs.add(index);
                        } else {
                          _expandedFaqs.remove(index);
                        }
                      });
                    },
                    shape: const Border(),
                    collapsedShape: const Border(),
                    tilePadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 6,
                    ),
                    childrenPadding: const EdgeInsets.only(
                      left: 18,
                      right: 18,
                      bottom: 18,
                    ),
                    title: Text(
                      faq.question,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    trailing: AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: app.primaryColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: app.primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          faq.answer,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: colorScheme.onSurfaceVariant,
                            height: 1.6,
                            fontSize: 14.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 28),
          ],

          // Кнопка скачивания
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => LinkLauncher.launchUrlString(app.downloadUrl),
              icon: const Icon(Icons.download_rounded, size: 22),
              label: const Text(
                'Скачать бесплатно',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: app.primaryColor,
                foregroundColor: colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 18),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    AppModel app,
    ColorScheme colorScheme,
    bool isMobile,
  ) {
    final logoAndTitle = Row(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: app.primaryColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: app.primaryColor.withValues(alpha: 0.2),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                app.logoPath,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.apps,
                  color: app.primaryColor,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                app.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                      letterSpacing: -0.5,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                app.subtitle,
                style: TextStyle(
                  color: app.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.desktop_windows_outlined,
                    size: 14,
                    color: colorScheme.outline,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Версия ${app.version} для Windows',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.outline,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

    final downloadButton = OutlinedButton.icon(
      onPressed: () => LinkLauncher.launchUrlString(app.downloadUrl),
      icon: const Icon(Icons.download_rounded, size: 18),
      label: const Text('Скачать'),
      style: OutlinedButton.styleFrom(
        foregroundColor: app.primaryColor,
        side: BorderSide(color: app.primaryColor, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          logoAndTitle,
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: downloadButton),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: logoAndTitle),
        const SizedBox(width: 16),
        downloadButton,
      ],
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    IconData icon,
    Color accentColor,
    ColorScheme colorScheme,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: accentColor, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                letterSpacing: -0.3,
              ),
        ),
      ],
    );
  }
}
