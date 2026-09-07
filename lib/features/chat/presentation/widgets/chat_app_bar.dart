import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/core/theme/theme_mode_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeMode = ref.read(themeModeProvider);
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
      actions: [
        IconButton(
          icon: Icon(
            themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
          ),
          onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
        ),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }
}
