import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/features/chat/data/chat_model.dart';
import 'package:flutter_ai_bot/features/chat/presentation/widgets/build_chat_list.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChatModel> chatModels = [
      ChatModel(isMe: true, text: 'Hey! How can I help you today?'),
      ChatModel(isMe: false, text: 'Can you explain Flutter State Management?'),
      ChatModel(
        isMe: true,
        text:
            'Sure! Flutter has several state management solutions like BLoC, Provider, Riverpod, and GetX.',
      ),
      ChatModel(isMe: false, text: 'Which one is best for a large project?'),
      ChatModel(
        isMe: true,
        text:
            'BLoC is a good choice for large and scalable Flutter applications.',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(children: [BuildChatList(messages: chatModels)]),
      ),
    );
  }
}
