import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/features/chat/presentation/providers/chat_notifier.dart';
import 'package:flutter_ai_bot/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildChatState extends ConsumerWidget {
  const BuildChatState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final colorScheme = Theme.of(context).colorScheme;
    ref.listen(chatProvider.select((state) => state.errorMsg), (
      previous,
      next,
    ) {
      if (next != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next)));
      }
    });

    final state = ref.watch(chatProvider);
    if (state.messages.isEmpty) {
      return Center(
        child: Text(
          '''Welcome! Let’s get started.''',
          style: TextStyle(fontSize: 20),
        ),
      );
    }
    final messages = state.messages;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return Column(
          children: [
            ChatBubble(message: message),
            state.isLoading && index == messages.length - 1
                ? Row(children: [const CircularProgressIndicator()])
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
