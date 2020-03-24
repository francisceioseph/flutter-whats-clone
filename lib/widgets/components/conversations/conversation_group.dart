import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/all_conversations.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/pinned_conversations.dart';

class ConversationGroup extends StatelessWidget {
  final Map<String, List<dynamic>> conversations;

  ConversationGroup({
    @required this.conversations,
  });

  @override
  Widget build(BuildContext context) {
    final pinned = conversations['pinned'];
    final all = conversations['all'];

    return CustomScrollView(
      slivers: <Widget>[
        if (pinned.isNotEmpty)
          PinnedConversations(
            chats: pinned,
          ),
        if (all.isNotEmpty)
          AllConversations(
            chats: all,
          ),
        if (pinned.isEmpty && all.isEmpty)
          SliverFillRemaining(
            child: Center(
              child: Container(
                child: Text('No chats found.'),
              ),
            ),
          )
      ],
    );
  }
}
