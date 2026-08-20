import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/features/chat/presentation/widgets/chat_bubble.dart';

class BuildChatList extends StatelessWidget {
  final List messages;

  const BuildChatList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return ChatBubble(message: message);
        },
      ),
    );
  }
}
