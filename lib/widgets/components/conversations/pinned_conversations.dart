import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/models/chat.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/conversation_header.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/conversation_item.dart';
import 'package:flutter_whats_clone/widgets/components/section_sliver_list.dart';

class PinnedConversations extends StatelessWidget {
  final List<Chat> chats;

  PinnedConversations({
    this.chats = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SectionSliverList(
      sliverListItemCount: chats.length,
      headerBuilder: () => ConversationSectionHeader(
        headerText: 'Pinned',
        leadingIcon: Icons.pin_drop,
      ),
      sliverListItemBuilder: (BuildContext context, int index) {
        return ConversationItem(
          chat: chats[index],
        );
      },
    );
  }
}
