import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/models/chat.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/conversation_header.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/conversation_item.dart';
import 'package:flutter_whats_clone/widgets/components/section_sliver_list.dart';

class AllConversations extends StatelessWidget {
  final List<Chat> chats;

  AllConversations({
    this.chats = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SectionSliverList(
      headerBuilder: () => ConversationSectionHeader(
        headerText: 'All Chats',
        leadingIcon: Icons.message,
      ),
      sliverListItemBuilder: (BuildContext context, int index) {
        return ConversationItem(
          chat: chats[index],
        );
      },
      sliverListItemCount: chats.length,
    );
  }
}
