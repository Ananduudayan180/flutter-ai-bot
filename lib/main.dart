import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/core/theme/app_theme.dart';
import 'package:flutter_ai_bot/features/onboarding/presentation/screens/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Ai App',
      theme: darkTheme,
      home: const OnboardingView(),
    );
  }
}
