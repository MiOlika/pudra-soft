import 'package:flutter/material.dart';
import 'package:pudra_soft/widgets/screenshot_gallery.dart';

import '../models/app_model.dart';
import '../utils/constants.dart';
import 'chewie_video_player.dart';

class AppDetailCard extends StatefulWidget {
  final AppModel app;

  const AppDetailCard({super.key, required this.app});

  @override
  State<AppDetailCard> createState() => _AppDetailCardState();
}

class _AppDetailCardState extends State<AppDetailCard> {
  int _currentScreenshotIndex = 0;
  final Set<int> _expandedFaqs = {};

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final app = widget.app;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
        ),
        boxShadow: [
          BoxShadow(
            color: app.primaryColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Шапка с логотипом и названием
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: app.primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
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
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.title,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      app.subtitle,
                      style: TextStyle(
                        color: app.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Версия ${app.version} для Windows',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                          ),
                    ),
                  ],
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => LinkLauncher.launchUrlString(app.downloadUrl),
                icon: const Icon(Icons.download, size: 18),
                label: const Text('Скачать'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: app.primaryColor,
                  side: BorderSide(color: app.primaryColor),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Видео демонстрация (если есть)
          if (app.videoPath != null && app.videoPath!.isNotEmpty) ...[
            ChewieVideoPlayer(
              videoPath: app.videoPath!,
              accentColor: app.primaryColor,
            ),
            const SizedBox(height: 24),
          ],

          // Описание
          Text(
            'Описание',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            app.detailedDescription,
            style: TextStyle(
              color: isDark ? Colors.grey[300] : Colors.grey[700],
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),

          // Скриншоты (карусель)
          if (app.screenshots.isNotEmpty) ...[
            const SizedBox(height: 12),
            ScreenshotGallery(
              screenshots: app.screenshots,
              accentColor: app.primaryColor,
            ),
            const SizedBox(height: 24),
          ],

          // Функции
          Text(
            'Ключевые возможности',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: app.features.map((feature) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: app.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  feature,
                  style: TextStyle(
                    color: app.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),

          // Преимущества
          Text(
            'Преимущества',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          ...app.benefits.map((benefit) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: app.primaryColor,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      benefit,
                      style: TextStyle(
                        color: isDark ? Colors.grey[300] : Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 24),

          // ===== НОВАЯ СЕКЦИЯ: FAQ ДЛЯ ПРИЛОЖЕНИЯ =====
          if (app.faqs.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.help_outline,
                        color: app.primaryColor,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Часто задаваемые вопросы о ${app.title}',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...app.faqs.asMap().entries.map((entry) {
                    final index = entry.key;
                    final faq = entry.value;
                    final isExpanded = _expandedFaqs.contains(index);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.grey[850] : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                        ),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
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
                          tilePadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          title: Text(
                            faq.question,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          trailing: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: app.primaryColor,
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                faq.answer,
                                style: TextStyle(
                                  color: isDark
                                      ? Colors.grey[400]
                                      : Colors.grey[600],
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Кнопка скачивания
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => LinkLauncher.launchUrlString(app.downloadUrl),
              icon: const Icon(Icons.download),
              label: const Text('Скачать бесплатно'),
              style: ElevatedButton.styleFrom(
                backgroundColor: app.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
