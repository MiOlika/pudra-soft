import 'package:flutter/material.dart';

/// Разделы главной страницы.
enum SiteSection { products, benefits, about, blog, contacts }

/// Прокрутка к разделам страницы.
class SiteNavigation {
  static final Map<SiteSection, GlobalKey> keys = {
    for (final section in SiteSection.values) section: GlobalKey(),
  };

  static void goTo(SiteSection section) {
    final context = keys[section]!.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
    );
  }
}
