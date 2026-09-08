import 'package:flutter/material.dart';

class CustomSeparator extends StatelessWidget {
  final EdgeInsets? margin;

  const CustomSeparator({super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      height: 1.5,
      margin: margin,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.transparent, // Слева прозрачный
            colorScheme.outline, // В центре цвет primary
            Colors.transparent, // Справа прозрачный
          ],
          stops: const [0.0, 0.5, 1.0], // Равномерное распределение
        ),
      ),
    );
  }
}
