import 'package:flutter_ai_bot/features/chat/data/repo/gemini_chat_repo_impl.dart';
import 'package:flutter_ai_bot/features/chat/domain/repo/chat_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRepoProvider = Provider<ChatRepo>((ref) {
  return GeminiChatRepoImpl();
});
