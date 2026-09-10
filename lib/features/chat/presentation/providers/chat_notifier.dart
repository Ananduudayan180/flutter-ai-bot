import 'package:flutter_ai_bot/features/chat/data/model/chat_model.dart';
import 'package:flutter_ai_bot/features/chat/presentation/providers/chat_provider.dart';
import 'package:flutter_ai_bot/features/chat/presentation/providers/chat_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends Notifier<ChatState> {
  @override
  ChatState build() {
    return ChatState();
  }

  Future<void> fetchGeminiResponse(String prompt) async {
    final userMessage = AiChatModel(isMe: true, text: prompt);

    final updatedMessages = [...state.messages, userMessage];

    state = state.copyWith(messages: updatedMessages, isLoading: true);

    try {
      final aiResponse = await ref
          .read(chatRepoProvider)
          .fetchGeminiResponse(prompt);

      final finalMessages = [...updatedMessages, aiResponse];

      state = state.copyWith(messages: finalMessages, isLoading: false);
    } catch (e, _) {
      state = state.copyWith(errorMsg: e.toString(), isLoading: false);
    }
  }
}

final chatProvider = NotifierProvider<ChatNotifier, ChatState>(
  ChatNotifier.new,
);
