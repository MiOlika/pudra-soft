import 'package:flutter/material.dart';

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
            const ProductCard(
              title: 'DoSka',
              description:
                  'Персональный конструктор проектов для Windows. Визуальное планирование, WBS, User Story и декомпозиция задач.',
              version: '0.1.6.0',
              features: [
                '📋 Иерархические списки задач (WBS)',
                '📝 Сбор пользовательских историй',
                '🔗 Связи между заметками',
                '✅ Чек-листы',
                '🎨 До 15 досок с цветовой сортировкой',
              ],
              downloadUrl: 'https://github.com/pudra-soft/doska/releases',
              color: Color(0xFF6C63FF),
            ),
            const SizedBox(height: 30),
            ProductCard(
              title: 'TimeFiller',
              description:
                  'Локальный планировщик для Windows. Управление отпусками, запись клиентов, планирование встреч и графики смен.',
              version: '0.3.3.0',
              features: const [
                '📅 Графики смен (2 через 2, 5/2)',
                '🏖️ Управление отпусками сотрудников',
                '👥 Запись клиентов и встреч',
                '🔄 Поддержка спринтов',
                '🎯 Фильтрация по категориям',
              ],
              downloadUrl: 'https://github.com/pudra-soft/timefiller/releases',
              color: const Color(0xFF00B894),
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
