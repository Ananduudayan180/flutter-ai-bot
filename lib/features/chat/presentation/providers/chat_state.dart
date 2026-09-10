import 'package:flutter_ai_bot/features/chat/data/model/chat_model.dart';

class ChatState {
  final List<AiChatModel> messages;
  final bool isLoading;
  final String? errorMsg;

  const ChatState({
    this.messages = const [],
    this.isLoading = false,
    this.errorMsg,
  });

  ChatState copyWith({
    List<AiChatModel>? messages,
    bool? isLoading,
    String? errorMsg,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
