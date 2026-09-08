import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/partner.dart';

class PartnerCard extends StatelessWidget {
  final Partner partner;

  const PartnerCard({super.key, required this.partner});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse(partner.websiteUrl),
              mode: LaunchMode.externalApplication);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Логотип партнёра (слева)
                Container(
                  width: isMobile ? 60 : 80,
                  height: isMobile ? 60 : 80,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 8 : 10,
                    vertical: isMobile ? 8 : 10,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      partner.logoPath,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Правая часть с информацией
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Название партнёра
                      Text(
                        partner.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Ссылка на сайт
                      Text(
                        partner.websiteUrl
                            .replaceAll('https://', '')
                            .replaceAll('http://', '')
                            .replaceAll('/', ''),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.outline,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Описание
                      Text(
                        partner.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: colorScheme.outline,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
