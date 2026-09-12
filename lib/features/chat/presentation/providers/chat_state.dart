import 'package:flutter_ai_bot/features/chat/data/model/chat_model.dart';

class ChatState {
  final List<AiChatModel> messages;
  final bool isLoading;
  final String? errorMsg;
  final CurrentAi currentAi;

  const ChatState({
    this.messages = const [],
    this.isLoading = false,
    this.errorMsg,
    this.currentAi = CurrentAi.chatGPT,
  });

  ChatState copyWith({
    List<AiChatModel>? messages,
    bool? isLoading,
    String? errorMsg,
    CurrentAi? currentAi,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
      currentAi: currentAi ?? this.currentAi,
    );
  }
}

enum CurrentAi { chatGPT, gemini }
