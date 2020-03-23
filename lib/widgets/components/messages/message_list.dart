import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/messages/message_list_item.dart';

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 123,
      itemBuilder: (BuildContext context, int index) {
        return MessageListItem();
      },
    );
  }
}
