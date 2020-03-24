import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/widgets/components/messages/message_list_item.dart';

class MessageList extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(milliseconds: 300),
      () => _controller.jumpTo(_controller.position.maxScrollExtent),
    );

    return ListView.builder(
      controller: _controller,
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return MessageListItem();
      },
    );
  }
}
