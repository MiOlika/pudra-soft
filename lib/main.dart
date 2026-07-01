import 'package:flutter/material.dart';
import 'package:pudra_soft/utils/app_theme.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pudra Soft',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      // или ThemeMode.system для автоопределения
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
