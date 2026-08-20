import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
      actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
    );
  }
}
