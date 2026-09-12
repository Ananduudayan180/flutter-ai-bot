import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/core/theme/theme_mode_notifier.dart';
import 'package:flutter_ai_bot/features/chat/presentation/providers/chat_notifier.dart';
import 'package:flutter_ai_bot/features/chat/presentation/providers/chat_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeMode = ref.read(themeModeProvider);
    final chatState = ref.watch(chatProvider);
    return AppBar(
      title: Row(
        children: [
          //Ai avatar
          CircleAvatar(
            backgroundColor: colorScheme.primary,
            child: Icon(Icons.smart_toy, color: colorScheme.onPrimary),
          ),
          const SizedBox(width: 12),
          //title and online status
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Zenvia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Online',
                style: TextStyle(fontSize: 12, color: colorScheme.primary),
              ),
            ],
          ),
        ],
      ),
      //Switch AI's
      actions: [
        PopupMenuButton<CurrentAi>(
          initialValue: CurrentAi.chatGPT,
          clipBehavior: Clip.antiAlias,
          menuPadding: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          color: colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          icon: Row(
            children: [
              chatState.currentAi == CurrentAi.chatGPT
                  ? Text('ChatGPT')
                  : Text('Gemini'),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          onSelected: (currentAi) =>
              ref.read(chatProvider.notifier).switchAi(currentAi),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: CurrentAi.chatGPT,
              child: ListTile(
                title: Text('ChatGPT'),
                subtitle: Text('GPT-5.6'),
              ),
            ),
            const PopupMenuItem(
              value: CurrentAi.gemini,
              child: ListTile(
                title: Text('Gemini'),
                subtitle: Text('3.5-flash-lite'),
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
          ),
          onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
        ),
      ],
    );
  }
}
