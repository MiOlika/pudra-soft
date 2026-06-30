import 'package:flutter/material.dart';

import '../widgets/app_header.dart';
import '../widgets/app_tabs.dart';
import '../widgets/features_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            const HeroSection(),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Наши продукты',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const AppTabs(),
            const SizedBox(height: 40),
            const FeaturesSection(),
            const SizedBox(height: 40),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
