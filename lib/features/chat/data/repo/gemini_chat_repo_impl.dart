import 'package:flutter_ai_bot/features/chat/data/model/chat_model.dart';
import 'package:flutter_ai_bot/features/chat/domain/repo/chat_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiChatRepoImpl extends ChatRepo {
  final apiKey = dotenv.env['GEMINI_API_KEY'];

  late final model = GenerativeModel(
    model: 'gemini-3.7-flash',
    apiKey: apiKey!,
  );

  @override
  Future<AiChatModel> fetchGeminiResponse(String prompt) async {
    try {
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      if (response.text != null && response.text!.isNotEmpty) {
        return AiChatModel(isMe: false, text: response.text!);
      }
      throw Exception('Empty response from Gemini');
    } on GenerativeAIException catch (e) {
      throw Exception('Gemini API Error: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
