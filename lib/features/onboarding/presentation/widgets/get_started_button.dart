import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/features/chat/presentation/screens/chat_view.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [colorScheme.primary, colorScheme.secondary],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ChatView()),
            (route) => false,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Get Started', style: textTheme.titleMedium),
              const SizedBox(width: 10),
              Icon(Icons.arrow_forward_rounded, color: colorScheme.onSurface),
            ],
          ),
        ),
      ),
    );
  }
}
