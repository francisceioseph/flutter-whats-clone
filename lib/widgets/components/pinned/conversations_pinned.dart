import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_whats_clone/widgets/components/conversations/conversation_item.dart';

class PinnedConversations extends StatelessWidget {
  final List<dynamic> conversations;

  PinnedConversations({
    @required this.conversations,
  });

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            child: Icon(Icons.pin_drop),
          ),
          Text('Pinned'),
        ],
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ConversationItem();
          },
          childCount: 3,
        ),
      ),
    );
  }
}
