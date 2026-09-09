import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/features/chat/data/model/chat_model.dart';

class ChatBubble extends StatelessWidget {
  final AiChatModel message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: message.isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Avatar
          if (!message.isMe) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: colorScheme.primary,
              child: Icon(
                Icons.smart_toy,
                size: 20,
                color: colorScheme.onPrimary,
              ),
            ),
            const SizedBox(width: 8),
          ],
          //bubble
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: message.isMe ? width / 1.5 : double.infinity,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: message.isMe
                      ? null
                      : colorScheme
                            .surface, // AppColors.kblack54.withOpacity(0.05),
                  gradient: message.isMe
                      ? LinearGradient(
                          colors: [colorScheme.primary, colorScheme.secondary],
                        )
                      : null,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomLeft: message.isMe
                        ? const Radius.circular(20)
                        : const Radius.circular(4),
                    bottomRight: message.isMe
                        ? const Radius.circular(4)
                        : const Radius.circular(20),
                  ),
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                    fontSize: 15,
                    color: message.isMe
                        ? colorScheme.onSecondary
                        : colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
