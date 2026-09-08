import 'package:flutter_ai_bot/features/chat/data/model/chat_model.dart';

abstract class ChatRepo {
  Future<AiChatModel> fetchGeminiResponse(String prompt);
}
