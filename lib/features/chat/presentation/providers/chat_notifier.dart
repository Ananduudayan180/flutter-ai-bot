import 'package:flutter_ai_bot/features/chat/data/model/chat_model.dart';
import 'package:flutter_ai_bot/features/chat/presentation/providers/chat_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends Notifier<AsyncValue<AiChatModel?>> {
  @override
  AsyncValue<AiChatModel?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> fetchGeminiResponse(String prompt) async {
    state = const AsyncValue.loading();
    try {
      final chatRepo = ref.read(chatRepoProvider);
      final aiChatModel = await chatRepo.fetchGeminiResponse(prompt);

      state = AsyncValue.data(aiChatModel);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final chatProvider = NotifierProvider<ChatNotifier, AsyncValue<AiChatModel?>>(
  ChatNotifier.new,
);
