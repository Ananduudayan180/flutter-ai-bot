import 'package:flutter/material.dart';

class RobotSection extends StatelessWidget {
  const RobotSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            //Glow
            Container(
              width: 290,
              height: 290,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.18),
                    blurRadius: 80,
                    spreadRadius: 15,
                  ),
                ],
              ),
            ),
            //Background Circle
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.12),
                    colorScheme.secondary.withValues(alpha: 0.06),
                  ],
                ),
              ),
            ),
            // Robot
            Image.asset(
              'assets/images/onboarding_robot.png',
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
