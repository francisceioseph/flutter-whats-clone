import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/models/message.dart';
import 'package:flutter_whats_clone/widgets/components/messages/message_list_item.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;

  final ScrollController _controller = ScrollController();

  MessageList({
    this.messages = const [],
  });

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(milliseconds: 300),
      () => _controller.jumpTo(_controller.position.maxScrollExtent),
    );

    return ListView.builder(
      controller: _controller,
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        final previous = index == 0 ? null : messages[index - 1];
        final current = messages[index];
        final next = index == messages.length - 1 ? null : messages[index + 1];

        return MessageListItem(
          previous: previous,
          current: current,
          next: next,
        );
      },
    );
  }
}
