import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/conversation_header.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/conversation_item.dart';
import 'package:flutter_whats_clone/widgets/components/section_sliver_list.dart';

class ConversationGroup extends StatelessWidget {
  final Map<String, List<dynamic>> conversations;

  ConversationGroup({
    @required this.conversations,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SectionSliverList(
          headerBuilder: () => ConversationSectionHeader(
            headerText: 'Pinned',
            leadingIcon: Icons.pin_drop,
          ),
          sliverListItemBuilder: (BuildContext context, int index) {
            return ConversationItem(
              isPinned: true,
            );
          },
          sliverListItemCount: 3,
        ),
        SectionSliverList(
          headerBuilder: () => ConversationSectionHeader(
            headerText: 'All Chats',
            leadingIcon: Icons.message,
          ),
          sliverListItemBuilder: (BuildContext context, int index) {
            return ConversationItem();
          },
          sliverListItemCount: 33,
        ),
      ],
    );
  }
}
