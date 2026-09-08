import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/core/theme/app_theme.dart';
import 'package:flutter_ai_bot/core/theme/theme_mode_notifier.dart';
import 'package:flutter_ai_bot/features/onboarding/presentation/screens/onboarding_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Ai App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const OnboardingView(),
    );
  }
}
