import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/site_navigation.dart';
import '../widgets/app_header.dart';
import '../widgets/blog_section.dart';
import '../widgets/call_to_action.dart';
import '../widgets/ecosystem_section.dart';
import '../widgets/features_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/partner_section.dart';
import '../widgets/product_section.dart';
import '../widgets/site_common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    final show = _scrollController.offset > 650;
    if (show != _showBackToTop) setState(() => _showBackToTop = show);
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final keys = SiteNavigation.keys;

    return Scaffold(
      floatingActionButton: _showBackToTop
          ? FloatingActionButton.small(
              tooltip: AppLocalizations.of(context).backToTop,
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward_rounded),
            )
          : null,
      // Шапка закреплена, чтобы меню, язык и тема были доступны на любом экране.
      body: Column(
        children: [
          const SiteHeader(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const HeroSection(),
                  const SectionGap(),
                  SectionShell(
                    key: keys[SiteSection.products],
                    child: const ProductSection(),
                  ),
                  const SectionGap(),
                  SectionShell(
                    key: keys[SiteSection.benefits],
                    child: const FeaturesSection(),
                  ),
                  const SectionGap(),
                  SectionShell(
                    key: keys[SiteSection.about],
                    child: const EcosystemSection(),
                  ),
                  const SectionGap(),
                  const SectionShell(child: CallToAction()),
                  const SectionGap(),
                  SectionShell(
                    key: keys[SiteSection.blog],
                    child: const BlogSection(),
                  ),
                  const SectionGap(),
                  const SectionShell(child: PartnerSection()),
                  const SectionGap(),
                  Footer(key: keys[SiteSection.contacts]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
