import 'package:flutter/material.dart';

import '../utils/constants.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final expandedSet = <int>{};

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Text(
            'Часто задаваемые вопросы',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 32),
          ...AppConstants.faqs.asMap().entries.map((entry) {
            final index = entry.key;
            final faq = entry.value;
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 0,
              color: isDark ? Colors.grey[850] : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                ),
              ),
              child: ExpansionTile(
                onExpansionChanged: (expanded) {
                  if (expanded) {
                    expandedSet.add(index);
                  } else {
                    expandedSet.remove(index);
                  }
                },
                title: Text(
                  faq['q']!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      faq['a']!,
                      style: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
