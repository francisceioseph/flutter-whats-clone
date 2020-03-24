import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/models/chat_group.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/all_conversations.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/pinned_conversations.dart';

class ConversationGroup extends StatelessWidget {
  final ChatGroup chatGroup;

  ConversationGroup({
    @required this.chatGroup,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        if (chatGroup.pinned.isNotEmpty)
          PinnedConversations(
            chats: chatGroup.pinned,
          ),
        if (chatGroup.all.isNotEmpty)
          AllConversations(
            chats: chatGroup.all,
          ),
        if (chatGroup.pinned.isEmpty && chatGroup.all.isEmpty)
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
