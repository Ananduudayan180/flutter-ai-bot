import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/features/chat/presentation/providers/chat_notifier.dart';
import 'package:flutter_ai_bot/features/chat/presentation/widgets/build_chat_state.dart';
import 'package:flutter_ai_bot/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:flutter_ai_bot/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatView extends ConsumerStatefulWidget {
  const ChatView({super.key});

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void callGemini() {
    final prompt = _textController.text.trim();
    if (prompt.isEmpty) return;
    ref.read(chatProvider.notifier).fetchGeminiResponse(prompt);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const BuildChatState(),
            ChatInputField(controller: _textController, onSend: callGemini),
          ],
        ),
      ),
    );
  }
}
