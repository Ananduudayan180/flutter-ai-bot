import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/features/chat/data/model/chat_model.dart';
import 'package:flutter_ai_bot/features/chat/presentation/providers/chat_notifier.dart';
import 'package:flutter_ai_bot/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BuildChatState extends ConsumerWidget {
  const BuildChatState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(chatProvider);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: state.when(
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => Align(
            alignment: Alignment.topLeft,
            child: SizedBox.fromSize(
              size: Size(50, 24),
              child: SpinKitThreeBounce(color: colorScheme.primary, size: 24.0),
            ),
          ),
          data: (AiChatModel? data) {
            if (data != null) {
              final messages = [data];
              return ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return ChatBubble(message: message);
                },
              );
            }
            return Center(
              child: Text(
                '''Welcome! Let’s get started.''',
                style: TextStyle(fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}
