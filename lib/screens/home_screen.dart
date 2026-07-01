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
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(),
            HeroSection(),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Наши продукты',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            AppTabs(),
            SizedBox(height: 40),
            FeaturesSection(),
            SizedBox(height: 40),
            Footer(),
          ],
        ),
      ),
    );
  }
}
