import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/app_header.dart';
import '../widgets/faq_section.dart';
import '../widgets/features_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/product_card.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Наши продукты',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            ProductCard(
              title: AppConstants.doskaTitle,
              description: AppConstants.doskaDescription,
              version: AppConstants.doskaVersion,
              features: AppConstants.doskaFeatures,
              downloadUrl: AppConstants.doskaDownloadUrl,
              color: AppConstants.doskaColor,
            ),
            const SizedBox(height: 30),
            ProductCard(
              title: AppConstants.timeFillerTitle,
              description: AppConstants.timeFillerDescription,
              version: AppConstants.timeFillerVersion,
              features: AppConstants.timeFillerFeatures,
              downloadUrl: AppConstants.timeFillerDownloadUrl,
              color: AppConstants.timeFillerColor,
            ),
            const SizedBox(height: 40),
            const FeaturesSection(),
            const SizedBox(height: 40),
            const FaqSection(),
            const SizedBox(height: 40),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
