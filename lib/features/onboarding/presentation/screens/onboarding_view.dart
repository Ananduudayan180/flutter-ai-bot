import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/features/onboarding/presentation/widgets/get_started_button.dart';
import 'package:flutter_ai_bot/features/onboarding/presentation/widgets/robot_section.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primary.withValues(alpha: 0.08),
              colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                // Robot Section
                const RobotSection(),
                // Title
                Text(
                  'Your Smart AI\nAssistant',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge!.copyWith(
                    height: 1.12,
                    letterSpacing: -0.8,
                  ),
                ),
                const SizedBox(height: 14),
                // Description
                Text(
                  'Ask questions, explore ideas,\nand get intelligent answers instantly.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                // Get Started Button
                const GetStartedButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
