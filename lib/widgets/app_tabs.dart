import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'app_detail_card.dart';

class AppTabs extends StatefulWidget {
  const AppTabs({super.key});

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: AppConstants.allApps.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Табы для переключения между приложениями
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[800] : Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: isDark ? Colors.grey[700] : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            labelColor: isDark ? Colors.white : Colors.black,
            unselectedLabelColor: isDark ? Colors.grey[400] : Colors.grey[600],
            tabs: AppConstants.allApps.map((app) {
              return Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Используем логотип в табе
                    if (app.logoPath.isNotEmpty)
                      Image.asset(
                        app.logoPath,
                        height: 24,
                        width: 24,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.apps,
                          color: app.primaryColor,
                          size: 24,
                        ),
                      ),
                    const SizedBox(width: 8),
                    Text(app.title),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: app.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        app.version,
                        style: TextStyle(
                          fontSize: 10,
                          color: app.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 24),

        // Контент для выбранного приложения
        SizedBox(
          height: 800, // Фиксированная высота для стабильности
          child: TabBarView(
            controller: _tabController,
            children: AppConstants.allApps.map((app) {
              return SingleChildScrollView(
                child: AppDetailCard(app: app),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
