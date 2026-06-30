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
      mainAxisSize: MainAxisSize.min,
      children: [
        // Квадратные карточки-табы по центру
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AnimatedBuilder(
            animation: _tabController,
            builder: (context, child) {
              return TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                indicator: const BoxDecoration(
                  color: Colors.transparent,
                ),
                dividerColor: Colors.transparent,
                labelColor: isDark ? Colors.white : Colors.black,
                unselectedLabelColor:
                    isDark ? Colors.grey[600] : Colors.grey[400],
                tabs: AppConstants.allApps.map((app) {
                  final isSelected =
                      _tabController.index == AppConstants.allApps.indexOf(app);

                  return Tab(
                    height: 170,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: 170,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (isDark ? Colors.grey[800] : Colors.white)
                            : (isDark ? Colors.grey[900] : Colors.grey[100]),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? app.primaryColor
                              : (isDark
                                  ? Colors.grey[700]!
                                  : Colors.grey[300]!),
                          width: isSelected ? 2.5 : 1.5,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: app.primaryColor.withOpacity(0.3),
                                  blurRadius: 16,
                                  offset: const Offset(0, 4),
                                  spreadRadius: 2,
                                ),
                              ]
                            : [
                                BoxShadow(
                                  color: isDark
                                      ? Colors.black.withOpacity(0.2)
                                      : Colors.grey.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Логотип
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? app.primaryColor.withOpacity(0.15)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: app.logoPath.isNotEmpty
                                ? Image.asset(
                                    app.logoPath,
                                    height: 40,
                                    width: 40,
                                    errorBuilder: (_, __, ___) => Icon(
                                      Icons.apps,
                                      color: isSelected
                                          ? app.primaryColor
                                          : (isDark
                                              ? Colors.grey[400]
                                              : Colors.grey[600]),
                                      size: 40,
                                    ),
                                  )
                                : Icon(
                                    Icons.apps,
                                    color: isSelected
                                        ? app.primaryColor
                                        : (isDark
                                            ? Colors.grey[400]
                                            : Colors.grey[600]),
                                    size: 40,
                                  ),
                          ),
                          const SizedBox(height: 8),
                          // Название приложения
                          Text(
                            app.title,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: isSelected
                                  ? app.primaryColor
                                  : (isDark
                                      ? Colors.grey[400]
                                      : Colors.grey[600]),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          // Версия
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? app.primaryColor.withOpacity(0.15)
                                  : (isDark
                                      ? Colors.grey[800]
                                      : Colors.grey[200]),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              app.version,
                              style: TextStyle(
                                fontSize: 9,
                                color: isSelected
                                    ? app.primaryColor
                                    : (isDark
                                        ? Colors.grey[500]
                                        : Colors.grey[500]),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // Кнопка "Скачать"
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: AppConstants.allApps.map((app) {
            return ElevatedButton.icon(
              onPressed: () => LinkLauncher.launchUrlString(app.downloadUrl),
              icon: Icon(
                Icons.download,
                size: 20,
              ),
              label: Text(
                'Скачать ${app.title}',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: app.primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 24),

        // Контент с деталями приложения
        Container(
          height: 500,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: TabBarView(
              controller: _tabController,
              children: AppConstants.allApps.map((app) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  child: AppDetailCard(app: app),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
