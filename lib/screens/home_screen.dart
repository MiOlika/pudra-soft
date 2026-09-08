import 'package:flutter/material.dart';

import '../widgets/app_header.dart';
import '../widgets/features_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/partner_section.dart';
import '../widgets/product_section.dart';

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
            ProductSection(),
            SizedBox(height: 40),
            PartnerSection(),
            SizedBox(height: 40),
            FeaturesSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
